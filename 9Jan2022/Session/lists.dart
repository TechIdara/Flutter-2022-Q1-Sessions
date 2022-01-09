void main() {
  //                 0  1  2  3  4  5
  List<int> marks = [1, 2, 3, 4, 5, 6];
  print(marks[0] + marks[1]);
  //                      0         1         2        3        4         5
  List<String> friends = ["Ishaq", "Ali", "Usama", "Talha", "Hasan", "Pata nh"];
  print(friends);
  friends[0] = "OK";
  print(friends);
  friends = ["Heloo", "World"];
  print(friends);
  print(["Heloo", "World"]);

  List<String> section2 = ["Ok", "Good", "Dart", "Hello"];
  List<List<List<String>>> sections = [
    [
      ["Ishaq", "Ali", "Noman"]
    ],
    [section2]
  ];
  print(sections[1][0]);
}
