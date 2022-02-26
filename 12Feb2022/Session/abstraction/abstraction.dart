import 'structure.dart';

void main(List<String> args) {
  SportsMan sm = Manager();
  Human manager = Manager();
  if (manager is SportsMan) {
    SportsMan managerBanaSportsMan = manager as SportsMan;
    //managerBanaSportsMan.play();
  }


  //(manager as Graduate).study();

  (Teacher() as Graduate).study();

  "".meraExtensionWalaMethod();
  "".test;

  1.hello();
}

extension StringHelper1 on String {
  meraExtensionWalaMethod() {
    print("OK");
  }
}

extension StringHelper2 on String {
  int get test => 1;

  meraExtensionWalaMethod1() {
    print("OK");
  }
}

extension IntExt on int {
  hello() {
    print("Hello world");
  }
}
