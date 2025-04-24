import 'package:permission_handler/permission_handler.dart';

Future<bool> requestPermission(Permission permission) async {
  PermissionStatus status = await permission.status;

  if (status.isGranted) {
    return true;
  }

  if (status.isDenied) {
    status = await permission.request();

    if (status.isGranted) {
      return true;
    }
  }

  if (status.isPermanentlyDenied) {
    await openAppSettings();
  }

  return status.isGranted;
}