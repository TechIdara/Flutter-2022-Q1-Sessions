import 'dart:io';

void main() {
  // infinite loop
  Map<String, String> names = {"name": "Ishaq"};
  bool isRunning = true;
  while (isRunning) {
    String command = stdin.readLineSync()!;
    print("Your command is $command");
    if (command == "band hoja bhai") {
      print("acha jara hu");
      isRunning = false;
    }
  }
}
