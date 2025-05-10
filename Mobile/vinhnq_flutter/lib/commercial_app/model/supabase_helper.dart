import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<String> uploadImage({
  required File image,
  required String bucket,
  required String path,
  bool upsert = false
}) async {
  final supabase = Supabase.instance.client;
  await supabase.storage.from(bucket).upload(path, image, fileOptions: FileOptions(cacheControl: '3600', upsert: upsert));

  final String publicUrl = supabase
      .storage
      .from(bucket)
      .getPublicUrl(path);

  return publicUrl;
}

Future<String> updateImage({
  required File image,
  required String bucket,
  required String path,
  bool upsert = false
}) async {
  final supabase = Supabase.instance.client;
  await supabase.storage.from(bucket).update(path, image, fileOptions: FileOptions(cacheControl: '3600', upsert: upsert));

  final String publicUrl = supabase
      .storage
      .from(bucket)
      .getPublicUrl(path);

  return "$publicUrl?ts=${DateTime.now().microsecond}";
}

Future<void> deleteImage({required String bucket, required String path}) async {
  final supabase = Supabase.instance.client;
  await supabase
      .storage
      .from(bucket)
      .remove([path]);
}

Stream<List<T>> getDataStream<T>({
  required String table,
  required List<String> ids,
  required T Function(Map<String, dynamic> json) fromJson
}) {
  final supabase = Supabase.instance.client;
  var stream = supabase.from(table).stream(primaryKey: ids);
  return stream.map((maps) => maps.map(
        (e) => fromJson(e),
  ).toList());
}

Future<Map<int, T>> getMapData<T>({
  required String table,
  required T Function(Map<String, dynamic> json) fromJson,
  required int Function(T t) getId,
}) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from(table).select();
  var iterable = data.map((e) => fromJson(e));
  Map<int, T> map = { for (var t in iterable) getId(t) : t };

  return map;
}

listenChangeData<T>(Map<int, T> maps, {
  Function()? updateUI,
  required T Function(Map<String, dynamic>) fromMap,
  required String table,
  String? schema = "public",
  required int Function(T t) getId,
}) {
  final supabase = Supabase.instance.client;
  supabase
      .channel('$schema:$table')
      .onPostgresChanges(
      event: PostgresChangeEvent.all,
      schema: schema,
      table: table,
      callback: (payload) {
        switch (payload.eventType) {
          case PostgresChangeEvent.insert:
          case PostgresChangeEvent.update: {
            T item = fromMap(payload.newRecord);
            maps[getId(item)] = item;
            updateUI?.call();
            break;
          }
          case PostgresChangeEvent.delete: {
            maps.remove(payload.oldRecord["id"]);
            updateUI?.call();
            break;
          }
          default: {}
        }
      })
      .subscribe();
}

