void main() {
  //makeTea(2);
  makeTeaNewQuetta(2, isQawa: true, numOfSugarSpoons: 2);
}

bool makeTeaNewQuetta(int numOfCups,
    {int numOfSugarSpoons = 2, bool isQawa = false}) {
  print("$numOfCups Tea is ready with $numOfSugarSpoons spoons of cheeni");
  return false;
}

bool makeTea(int numOfCups, [int numOfSugarSpoons = 2, bool isQawa = false]) {
  print("$numOfCups Tea is ready with $numOfSugarSpoons spoons of cheeni");
  return false;
}
