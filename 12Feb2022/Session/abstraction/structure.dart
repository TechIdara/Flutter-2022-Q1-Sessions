abstract class SportsMan {
  play();
}

abstract class Human {
  String name = "";
  String gender = "";
  int age = 0;

  void work();

  void eat() {
    print("I am eating now");
  }
}

abstract class Graduate {
  double cgpa = 0.0;

  topiUrao();

  study() {
    print("Mai to graduate hun :D");
  }
}

class Teacher extends Graduate {
  @override
  topiUrao() {
    print("Teacher n b uradi!");
  }

  @override
  study() {
    print("Hello world");
  }
}

class Employee extends Human implements SportsMan, Graduate {
  String idNumber = "Abc021";

  @override
  void work() {}

  @override
  play() {
    print("I play football");
  }

  @override
  topiUrao() {
    print("NH mai nh urata mobile acha nh h ");
  }

  @override
  study() {
    print("Employee is studying");
  }

  @override
  double cgpa = 0.0;
}

class Manager extends Employee {
  @override
  work() {
    print("Manager is managing the department");
  }
}

class OfficeBoy extends Employee {
  @override
  work() {
    print("For utility works");
  }
}
