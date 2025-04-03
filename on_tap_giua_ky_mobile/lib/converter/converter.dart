import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  final TextEditingController centimetController = TextEditingController();
  final TextEditingController inchController = TextEditingController();
  final List<String> results = ["Không có kết quả"];

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
      results.clear();
      results.add(centimetResult);
      results.add(inchResult);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Centimet"),
            TextField(
              keyboardType: TextInputType.number,
              controller: centimetController,
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      inchToCentimet();
                    },
                    icon: Icon(Icons.arrow_upward, size: 30,)
                ),
                IconButton(
                    onPressed: () {
                      centimetToInch();
                    },
                    icon: Icon(Icons.arrow_downward, size: 30,)
                )
              ],
            ),
            SizedBox(height: 30,),
            Text("Inch"),
            TextField(
              keyboardType: TextInputType.number,
              controller: inchController,
            ),
            SizedBox(height: 30,),
            Text("Kết quả tính toán", style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => ListTile(
                      title: Text(results[index]),
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    ),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: results.length)
            )
          ],
        ),
      )
    );
  }
}
