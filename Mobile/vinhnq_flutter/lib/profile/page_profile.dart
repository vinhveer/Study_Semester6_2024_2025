import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  DateTime ngaySinh = DateTime(2004, 3, 8);
  String gioiTinh = "Nam";
  List<String> nnlts = ["java", "csharp", "cpp", "python", "typescript", "Khác"];
  String? nnlt = "java";
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hồ sơ của tôi"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _buildBody(index),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/img.png"),
                ),
                accountName: Text("Nguyễn Quang Vinh"),
                accountEmail: Text("vinh.nqu.64cntt@ntu.edu.vn")
            ),
            ListTile(
              leading: Icon(Icons.sms),
              title: Text("SMS"),
              trailing: Text("10"),
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  index = 1;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.inbox),
              title: Text("Inbox"),
              trailing: Text("5"),
            ),
            ListTile(
              leading: Icon(Icons.send),
              title: Text("Sent"),
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text("Delete"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home, color: Colors.blue,)
            ),
            BottomNavigationBarItem(
                label: "SMS",
                icon: Icon(Icons.sms, color: Colors.orange,)
            ),
            BottomNavigationBarItem(
                label: "Phone",
                icon: Icon(Icons.call, color: Colors.green,)
            ),
          ],
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
      ),
    );
  }

  Widget _buildHome() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 3 / 4,
                child: Image.asset("assets/images/img.png"),
              ),
            ),
            SizedBox(height: 10,),
            Text("Họ và tên"),
            Text("Nguyễn Quang Vinh", style: TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),
            Text("Ngày sinh"),
            Row(
              children: [
                Expanded(child: Text("${ngaySinh.day}/${ngaySinh.month}/${ngaySinh.year}", style: TextStyle(fontSize: 16))),
                IconButton(
                    onPressed: () async {
                      DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: ngaySinh,
                          firstDate: DateTime(1990),
                          lastDate: DateTime(2040)
                      );
                      if (selectedDate != null) {
                        setState(() {
                          ngaySinh = selectedDate;
                        });
                      }
                    },
                    icon: Icon(Icons.calendar_month)
                ),
              ],
            ),
            SizedBox(height: 15,),
            Text("Giới tính"),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("Nam"),
                    value: "Nam",
                    groupValue: gioiTinh,
                    onChanged: (value) {
                      setState(() {
                        gioiTinh = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("Nữ"),
                    value: "Nữ",
                    groupValue: gioiTinh,
                    onChanged: (value) {
                      setState(() {
                        gioiTinh = value!;
                      });
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 15,),
            Text("Sở thích"),
            Text("Xem phim, ...", style: TextStyle(fontStyle: FontStyle.italic),),
            SizedBox(height: 15,),
            Text("Ngôn ngữ lập trình giỏi nhất của bạn"),
            DropdownButton<String>(
              isExpanded: true,
              value: nnlt,
              items: nnlts.map(
                    (e) {
                  return DropdownMenuItem<String>(
                      value: e, // Không thay đổi
                      child: Text(e)
                  );
                },
              ).toList(),
              onChanged: (value) {
                setState(() {
                  nnlt = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSMS() {
    return Center(child: Text("SMS", style: TextStyle(fontSize: 20),),);
  }

  Widget _buildPhone() {
    return Center(child: Text("Phone", style: TextStyle(fontSize: 20),),);
  }

  Widget _buildBody(int index) {
    switch(index) {
      case 0: return _buildHome();
      case 1: return _buildSMS();
      case 2: return _buildPhone();
      default: return _buildHome();
    }
  }
}