Future<String> greeting(String p) async {
  var message = Future.delayed(Duration(seconds: 5), () => "Hello $p");
  return message;
}

void main() {
  print("Waiting ...");
  greeting("64.CNTT-3").then((value) {
    print(value);
  });
  print("Done");
}
