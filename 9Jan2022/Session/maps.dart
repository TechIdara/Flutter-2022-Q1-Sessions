void main() {
  Map<String, int> marks = {"Ishaq": 10, "Ali": 50, "Ishaq": 100};
  print(marks["Ishaq"]);

  List<Map<String, int>> marks2 = [
    {"Ishaq": 100, "Hassan": 200},
    {"Ishaq1": 100, "Hassan1": 200},
  ];
  List<String> names = ["Car", "Bus", "Truck"];
  print(names[1]);
  List<List<String>> list2 = [names, names, names];
  print(list2[2][2]);
  List<List<List<String>>> list3 = [list2];
  print(list3[0][0][2]);
  List<List<List<List<String>>>> myTestDimenList = [
    [
      [
        ["One", "Two", "Three"]
      ]
    ],
    [
      [
        ["One", "Two", "Three"]
      ]
    ],
    [
      [
        ["One", "Two", "Three"]
      ]
    ]
  ];

  marks2[0]["Ishaq"] = 200;
  print(marks2[0]["Ishaq"]);
  String nameToFind = "Ishaq1";
  int row0 = 1;
  print(marks2[row0][nameToFind]);
}
