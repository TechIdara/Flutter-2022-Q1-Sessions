void main() {
  Map<String, int> marks = {"Ishaq": 10, "Ali": 50, "Ishaq": 100};
  print(marks["Ishaq"]);

  List<Map<String, int>> marks2 = [
    {"Ishaq": 100, "Hassan": 200},
    {"Ishaq1": 100, "Hassan1": 200},
  ];
  marks2[0]["Ishaq"] = 200;
  print(marks2[0]["Ishaq"]);
  String nameToFind = "Ishaq1";
  int row0 = 1;
  print(marks2[row0][nameToFind]);
}
