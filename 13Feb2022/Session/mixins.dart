// Mixins
// Enums
// Exception Handling
// Null safety
// Git

void main(List<String> args) {}

mixin Walk {
  int numOfLegs = 2;

  void walkNow() {
    print("Chal rhaa hu");
  }
}

mixin Fly {
  void flyNow() {
    print("Urh rha hu");
  }
}

mixin Swim {
  void swimNow() {
    print("tair rha hu");
  }
}

abstract class Animal {
  void eat();
}

abstract class Mamal extends Animal {}

class Dolphin extends Mamal with Swim {
  @override
  void eat() {
    print("Nh pata");
  }
}

class Bat extends Mamal with Walk, Fly {
  @override
  void eat() {
    print("Ghar m hta h kuch");
  }
}

class Cat extends Mamal with Walk {
  @override
  void eat() {
    print("Milk");
  }

  int numOfLegs1 = 2;
}
