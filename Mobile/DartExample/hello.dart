double chia(int sbc, int sc) {
  return sbc / sc;
}

double chia2({required int sbc, required int sc}) {
  return sbc / sc;
}

int cong({int? a, int? b, int? c}) {
  return (a ?? 0) + (b ?? 0) + (c ?? 0);
}

class Cat {
  String name, color;
  int? age;

  Cat({required this.name, required this.color});

  Cat.favourite({required this.name, required this.color}) {
    this.age = 97;
  }

  @override
  String toString() {
    return 'Cat{name: $name, color: $color, age: $age}';
  }
}

void main() {
  print(chia(5, 2));
  print(chia2(sbc: 3, sc: 2));
  print(cong());
  print(cong(b: 5));
  print(cong(b: 5, c: 2));
  print(cong(a: 1, b: 5, c: 2));

  Cat meomeo = Cat(name: "Trinh Tran Phuong Tuan", color: "orange");
  Cat f = Cat.favourite(name: "Tom", color: "White");
  print(f.toString());
}
