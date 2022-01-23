void main() {
  List<String> foods = ["Burger", "Pizza", "Fries"];
  // for (String food in foods) {
  //   print(food);
  // }
  foods.add("Donut");
  foods.forEach(print);
  List<String> firstCharOfEveryFood = foods.map(changeMyFood).toList();
  print(firstCharOfEveryFood);
  List<String> changedValues = [];
  for (String food in foods) {
    String newValue = changeMyFood(food);
    changedValues.add(newValue);
  }
  print(changedValues);
}

String changeMyFood(String food) {
  return food[0];
}

void forEveryFood(String food) {
  print("I really like $food");
}
