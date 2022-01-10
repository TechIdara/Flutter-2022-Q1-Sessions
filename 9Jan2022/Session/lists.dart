void main() {
  //                 0  1  2  3  4  5
  List<int> marks = [1, 2, 3, 4, 5, 6];
  marks[0] = 10;
  print(marks[0] + marks[1]);
  //                      0         1         2        3        4         5
  List<String> friends = ["Ishaq", "Ali", "Usama", "Talha", "Hasan", "Pata nh"];
  print(friends);
  friends[0] = "OK";
  print(friends);
  friends = ["Heloo", "World"];
  print(friends);
  print(["Heloo", "World"]);
  List<String> section1 = ["Ishaq", "Ali", "Hasan"];
  List<List<String>> sections = [
    section1,
    ["Usama", "Ahsan", "Jamal"]
  ];
  // RC , R = Row, C = Col
  print(sections[0][0]);
}
