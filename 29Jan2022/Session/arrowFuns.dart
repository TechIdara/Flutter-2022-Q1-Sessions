void main() {
  "${1 + 2}";
  print(isChaiReady(-10));
  List<String> cars = ["Toyota", "Honda", "Audi"];
  cars.map((car) => "$car is great");
  Function sum = (int a, int b) => a + b;
}

bool isChaiReady(int numOfSpoons) => numOfSpoons > 0;
