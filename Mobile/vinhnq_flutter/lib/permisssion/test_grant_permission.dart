import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thuc_hanh/helpers/permission_grant.dart';
import 'package:url_launcher/url_launcher.dart';

class PageGrantPermission extends StatefulWidget {
  const PageGrantPermission({super.key});

  @override
  State<PageGrantPermission> createState() => _PageGrantPermissionState();
}

class _PageGrantPermissionState extends State<PageGrantPermission> {
  TextEditingController phoneNumber = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grant Permission"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
                onPressed: () async {
                  String message;

                  var status = await requestPermission(Permission.camera);

                  if (status) {
                    message = "Quyền sử dụng camera đã được cấp";
                  } else {
                    message = "Quyền sử dụng camera đã bị từ chối";
                  }

                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                    )
                  );
                },
                child: Text("Grant Camera Permission")
            ),
            SizedBox(height: 30,),
            TextField(
              controller: phoneNumber,
              decoration: InputDecoration(
                hintText: "Nhập số điện thoại",
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: () async {
                  String phoneNumberText = phoneNumber.text;
                  final Uri launchUri = Uri(
                    scheme: 'tel',
                    path: phoneNumberText,
                  );
                  await launchUrl(launchUri);
                },
                child: Text("Gọi điện")
            )
          ],
        ),
      ),
    );
  }
}
