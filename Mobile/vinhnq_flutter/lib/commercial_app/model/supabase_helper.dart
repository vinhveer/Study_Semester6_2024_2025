import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<String> uploadImage({required File image, required String bucket, required String path}) async {
  await supabase.storage.from(bucket).upload(path, image, fileOptions: const FileOptions(cacheControl: '3600', upsert: false));

  final String publicUrl = supabase
      .storage
      .from(bucket)
      .getPublicUrl(path);

  return publicUrl;
}

Future<void> deleteImage({required String bucket, required String path}) async {
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
  var stream = supabase.from("Fruit").stream(primaryKey: ["id"]);
  return stream.map((maps) => maps.map(
        (e) => fromJson(e),
  ).toList());

  // return supabase
  //     .from("Fruit")
  //     .stream(primaryKey: ["id"])
  //     .map((data) => data.map((item) => Fruit.fromMap(item)).toList());
}

Future<Map<int, T>> getMapData<T>({
  required String table,
  required T Function(Map<String, dynamic> json) fromJson,
  required int Function(T t) getId,
}) async {
  final data = await supabase.from(table).select();
  var iterable = data.map((e) => fromJson(e));
  Map<int, T> map = Map.fromIterable(iterable, key: (t) => getId(t), value: (t) => t,);

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


