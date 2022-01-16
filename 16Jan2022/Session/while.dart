void main() {
  // bool isNumeric = true;
  // bool capitalLetters = false;
  // bool lowercaseLetters = true;
  // bool specialCharactersLetters = true;
  // bool myVal = isNumeric &&
  //     capitalLetters &&
  //     lowercaseLetters &&
  //     specialCharactersLetters;
  List<String> topics = ["Data Type", "Loops", "Functions"];
  String currentTopic = "Loops";
  int numVal = 0;
  while (numVal < topics.length) {
    int currentValue = numVal;
    print("Checking ${topics[currentValue]}");
    numVal++;
    if (topics[currentValue] == currentTopic) {
      continue;
    }
    print("Today we are learning ${topics[currentValue]}");
  }
}
