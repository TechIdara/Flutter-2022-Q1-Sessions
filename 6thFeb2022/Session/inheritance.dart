// Programming Types
// Functional , Object Oriented
// Object Oriented Comcepts
// 1. Inheritance
// 2. Polymorphism
// 3. Abstraction
// 4. Encapsulation

// Types of inheritance
// Single, Multilevel, Hirerichal
void main(List<String> args) {
  var men = Men("Male", "Ali", 10);
  int age = 10;
  men.perDayWork();
}

class Human {
  String name = "";
  int age = 0;
  Human(this.name, this.age) {
    print("Hello from Human");
  }

  perDayWork() {
    print("Eat");
    print("Survive");
    print("Sleep");
  }
}

class Men extends Human {
  String gender = "Male";
  Men(this.gender, String n, int a) : super(n, a) {
    print("Hello from men");
  }

  @override
  perDayWork() {
    print("Eat");
    print("Work");
    print("Sleep");
  }
}

class Women extends Human {
  String gender = "FeMale";
  Women(this.gender, String n, int a) : super(n, a) {
    print("Hello from men");
  }
}
