import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rss_example/model.dart';

import 'controller.dart';

class PageSettings extends StatefulWidget {
  const PageSettings({super.key});

  @override
  State<PageSettings> createState() => _PageSettingsState();
}

class _PageSettingsState extends State<PageSettings> {
  final RssController rssController = Get.find<RssController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phần nguồn tin hiện tại
            GetBuilder<RssController>(
                id: "resource",
                builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nguồn tin hiện tại',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      _buildResourceSelector(),
                      const Divider(height: 32),
                    ],
                  );
                }
            ),

            // Phần đề mục hiện tại
            GetBuilder<RssController>(
                id: "header",
                builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Đề mục hiện tại',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      _buildHeaderSelector(),
                      const Divider(height: 32),
                    ],
                  );
                }
            ),

            // Phần quản lý nguồn tin
            const Text(
              'Quản lý nguồn tin',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: _buildResourceList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddResourceDialog(context),
        child: const Icon(Icons.add),
        tooltip: 'Thêm nguồn tin mới',
      ),
    );
  }

  Widget _buildResourceSelector() {
    List<String> resourceNames = rssController.getResourceNames();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          isExpanded: true,
          value: rssController.currentResourceIndex.value,
          items: List.generate(resourceNames.length, (index) {
            return DropdownMenuItem<int>(
              value: index,
              child: Text(resourceNames[index]),
            );
          }),
          onChanged: (value) {
            if (value != null) {
              rssController.changeResource(value);
            }
          },
        ),
      ),
    );
  }

  Widget _buildHeaderSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: rssController.currentHeaderLabel,
          items: rssController.headerLabels.map((header) {
            return DropdownMenuItem<String>(
              value: header,
              child: Text(header),
            );
          }).toList(),
          onChanged: (value) {
            rssController.changeHeader(value);
          },
        ),
      ),
    );
  }

  Widget _buildResourceList() {
    return Obx(() => ListView.builder(
      itemCount: rssController.resources.length,
      itemBuilder: (context, index) {
        final resource = rssController.resources[index];
        final isCurrentResource = index == rssController.currentResourceIndex.value;

        return Card(
          elevation: isCurrentResource ? 3 : 1,
          color: isCurrentResource ? Colors.blue.shade50 : null,
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            title: Text(
              resource.name,
              style: TextStyle(
                fontWeight: isCurrentResource ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            subtitle: Text('${resource.headers.length} đề mục'),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: rssController.resources.length <= 1
                  ? null
                  : () => _showDeleteConfirmation(context, resource),
            ),
            onTap: () {
              rssController.changeResource(index);
            },
          ),
        );
      },
    ));
  }

  void _showDeleteConfirmation(BuildContext context, RssResource resource) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Xác nhận xóa'),
        content: Text('Bạn có chắc muốn xóa nguồn tin "${resource.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              rssController.removeResource(resource.id);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Đã xóa nguồn tin ${resource.name}')),
              );
            },
            child: const Text('Xóa', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showAddResourceDialog(BuildContext context) {
    final nameController = TextEditingController();
    final idController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    // Các trường mặc định cho nguồn tin mới
    String startImageRegex = 'img src="';
    String endImageRegex = '"';
    String startDescriptionRegex = "</a></br>";
    String endDescriptionRegex = "";

    // Map cho các đề mục mặc định
    Map<String, String> defaultHeaders = {
      "Trang chủ": "",
      "Sức khỏe": "",
      "Kinh doanh": "",
      "Giải trí": "",
    };

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thêm nguồn tin mới'),
        content: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Tên nguồn tin',
                    hintText: 'VD: Thanh Niên',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tên nguồn tin';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: idController,
                  decoration: const InputDecoration(
                    labelText: 'ID nguồn tin',
                    hintText: 'VD: thanhnien',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập ID nguồn tin';
                    }
                    if (rssController.resources.any((resource) => resource.id == value)) {
                      return 'ID này đã tồn tại';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Lưu ý: Các cài đặt nâng cao như regex và URL đề mục cần được thêm bởi nhà phát triển.',
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // Tạo nguồn tin mới với các cài đặt mặc định
                final newResource = RssResource(
                  id: idController.text,
                  name: nameController.text,
                  startImageRegex: startImageRegex,
                  endImageRegex: endImageRegex,
                  startDescriptionRegex: startDescriptionRegex,
                  endDescriptionRegex: endDescriptionRegex,
                  headers: defaultHeaders,
                );

                rssController.addResource(newResource);
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Đã thêm nguồn tin ${nameController.text}'),
                    action: SnackBarAction(
                      label: 'Thiết lập URL',
                      onPressed: () {
                        // Hiển thị dialog để thiết lập URL cho các đề mục
                        _showSetupUrlsDialog(context, newResource);
                      },
                    ),
                  ),
                );
              }
            },
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }

  void _showSetupUrlsDialog(BuildContext context, RssResource resource) {
    // Tạo controllers cho các trường nhập URL
    Map<String, TextEditingController> controllers = {};
    for (var header in resource.headers.keys) {
      controllers[header] = TextEditingController(text: resource.headers[header]);
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Thiết lập URL cho ${resource.name}'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...resource.headers.keys.map((header) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextField(
                    controller: controllers[header],
                    decoration: InputDecoration(
                      labelText: header,
                      hintText: 'Nhập URL RSS cho $header',
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              // Cập nhật URLs cho các đề mục
              Map<String, String> newHeaders = {};
              for (var header in resource.headers.keys) {
                newHeaders[header] = controllers[header]!.text;
              }

              // Cập nhật resource trong danh sách
              final index = rssController.resources.indexWhere((r) => r.id == resource.id);
              if (index >= 0) {
                final updatedResource = RssResource(
                  id: resource.id,
                  name: resource.name,
                  startImageRegex: resource.startImageRegex,
                  endImageRegex: resource.endImageRegex,
                  startDescriptionRegex: resource.startDescriptionRegex,
                  endDescriptionRegex: resource.endDescriptionRegex,
                  headers: newHeaders,
                );

                rssController.resources[index] = updatedResource;
                rssController.update(["resource"]);

                // Nếu đây là nguồn tin hiện tại, cập nhật các giá trị hiện tại
                if (index == rssController.currentResourceIndex.value) {
                  rssController.currentResource = updatedResource;
                  rssController.headerLabels = updatedResource.headers.keys.toList();
                  rssController.currentHeaderLabel = rssController.headerLabels[0];
                  rssController.currentUrl = updatedResource.headers[rssController.currentHeaderLabel]!;
                  rssController.update(["header"]);
                  rssController.update(["rss"]);
                }
              }

              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Đã cập nhật URL cho ${resource.name}')),
              );
            },
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
  }
}