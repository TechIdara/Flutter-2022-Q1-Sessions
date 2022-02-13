import 'dart:io';

void main(List<String> args) {
  List<String> friends = ["Ali", "Hasan"];

  try {
    // RangeError
    friends[2000];

    // FormatException
    int age = int.parse(stdin.readLineSync()!);
    print(age);
  } on RangeError catch (e) {
    print(e);
  } catch (e) {
    print(e);
    print("Hello world");
  }

  print(friends.runtimeType);
}
