void main() {
  var achaiDost = getGoodFriends(["Ali", "Ishaq", "Hassan", "Chai Wala"]);
  var saraiDost = ["Ali", "Ishaq", "Hassan", "Chai Wala"];
  for (String achaDost in getGoodFriends(saraiDost)) {}
  print(achaiDost);
}

List<String> getGoodFriends(List<String> allFreinds) {
  List<String> finalGoodFriends = [];
  for (String friend in allFreinds) {
    if (friend == "Ali" || friend == "Chai Wala") {
      finalGoodFriends.add(friend);
    }
  }
  return finalGoodFriends;
}
