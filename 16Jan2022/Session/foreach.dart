void main() {
  // Map<String, String> myData = {
  //   "Name":"Ishaq",
  //   "email":"isahq@gmail.com",
  // };
  // for (String dataItem in myData.entries) {

  // }

  List<List<String>> sections = [
    /**0 */ ["Ali", "Hasan", "Owais"],
    /**1 */ ["abc", "123", "456"],
  ];

  // int count = 0;
  // meraWhileLoop:
  // while (count <= 2) {
  //   print("abc ${count++}");
  // }

  abcXyz:
  for (List<String> students in sections) {
    for (String student in students) {
      if (student == "Hasan") {
        // true
        break abcXyz;
      }
      print(student);
    }
    print("=====");
  }
}
