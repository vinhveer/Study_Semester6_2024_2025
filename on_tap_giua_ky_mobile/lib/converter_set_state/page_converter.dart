import 'package:flutter/material.dart';

class PageConverter extends StatefulWidget {
  const PageConverter({super.key});

  @override
  State<PageConverter> createState() => _PageConverterState();
}

class _PageConverterState extends State<PageConverter> {
  final TextEditingController centimetController = TextEditingController();
  final TextEditingController inchController = TextEditingController();
  final List<String> result = ["Không có kết quả"];

  void inchToCentimet() {
    double inch = double.tryParse(inchController.text) ?? 0;
    double centimet = inch * 2.54;

    setState(() {
      centimetController.text = centimet.toStringAsFixed(2);
      updateResult(centimet, inch);
    });
  }

  void centimetToInch() {
    double centimet = double.tryParse(centimetController.text) ?? 0;
    double inch = centimet / 2.54;

    setState(() {
      inchController.text = inch.toStringAsFixed(2);
      updateResult(centimet, inch);
    });
  }

  void updateResult(double centimet, double inch) {
    String centimetResult = "${centimet.toStringAsFixed(2)} cm = ${inch.toStringAsFixed(2)} inch";
    String inchResult = "${inch.toStringAsFixed(2)} inch = ${centimet.toStringAsFixed(2)}";

    setState(() {
      result.clear();
      result.add(centimetResult);
      result.add(inchResult);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chuyển đổi đơn vị"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Centimet"),
                      TextField(
                        controller: centimetController,
                        keyboardType: TextInputType.number,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            inchToCentimet();
                          },
                          icon: Icon(Icons.arrow_back, size: 30,)
                      ),
                      IconButton(
                          onPressed: () {
                            centimetToInch();
                          },
                          icon: Icon(Icons.arrow_forward, size: 30,)
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Inch"),
                      TextField(
                        controller: inchController,
                        keyboardType: TextInputType.number,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 50,),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Kết quả tính toán", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(result[index]),
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: result.length
              )
            )
          ],
        ),
      ),
    );
  }
}
