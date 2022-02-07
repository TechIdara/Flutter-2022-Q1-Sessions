void main(List<String> args) {
  Men male = Men("Male", "Ali", 10);
  Women women = Women("Female", "Alisha", 10);
  printWorkForTheDay(male);
  print("====");
  printWorkForTheDay(women);
}

printWorkForTheDay(Human men) {
  men.perDayWork();
}

class Human {
  String name = "";
  int age = 0;
  Human(this.name, this.age);

  perDayWork() {
    print("Eat");
    print("Survive");
    print("Sleep");
  }
}

class Men extends Human {
  String gender = "Male";
  Men(this.gender, String n, int a) : super(n, a);

  @override
  perDayWork() {
    print("Eat");
    print("Work");
    print("Sleep");
  }
}

class Women extends Human {
  String gender = "FeMale";
  Women(this.gender, String n, int a) : super(n, a);
}
