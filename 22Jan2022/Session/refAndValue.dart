import 'dart:io';

void main() {
  List<String> contacts = [];
  int numOfTimesRepeated = 0;
  while (true) {
    mainMenu(contacts, numOfTimesRepeated);
  }
}

void mainMenu(List<String> contacts, int numOfTimes) {
  print("==== Main menu ${numOfTimes++} ====");
  print("1. Add Contact");
  print("2. List Contact");
  print("==== Main menu ====");
  print("Batao kia krna h:");
  String option = stdin.readLineSync()!;
  if (option == "1") {
    addContact(contacts);
  } else if (option == "2") {
    listAll(contacts);
  } else {
    return;
  }
}

addContact(List<String> contacts) {
  print("");
  print("Bndai ka naam?");
  String contactName = stdin.readLineSync()!;
  contacts.add(contactName);
}

listAll(List<String> contacts) {
  int sno = 1;
  print("");
  for (String contact in contacts) {
    print("${sno++}. $contact");
  }
}
