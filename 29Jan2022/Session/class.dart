void main() {
  // Object 1
  Gari tarzan1 = Gari();
  //tarzan1.startHojao();
  //print(tarzan1.name);

  // Object 2
  Gari tarzanW11 = Gari.engineKsth();
  //tarzanW11.startHojao();

  //print(tarzanW11.name);
  //print(tarzanW11.engineCC);

  Gari bus = Gari.engineKsth(engineCC: 5000);
  //print(bus.engineCC);
  tarzan1.showInfo();
  print("------------------");
  tarzanW11.showInfo();
  print("------------------");
  bus.showInfo();
}

class Gari {
  String name = "";
  int engineCC = 0;

  Gari({String name = ""}) {
    //print("Hello world $name");
    this.name = name;
  }

  Gari.engineKsth({this.engineCC = 2000});

  startHojao() {
    print("M KHud ho jati hu start $name");
  }

  showInfo() {
    String name = "Isahq";
    print("Car Name is ${this.name}");
    print("Car Engine is $engineCC CC");
  }
}
