void main() {
  while (true) {
    if (!isChaiAvailable()) {
      print("Chai to nh h bhai");
      return;
    }
  }
  bool isTeaReady = makeTea(2, 2);
  if (isTeaReady) {
    print("Shukriya! bhai");
  } else {
    print("Jaldi lao bhai kia krrahai ho");
  }
}

bool makeTea(int numOfCups, int numOfSugarSpoons) {
  print("$numOfCups Tea is ready with $numOfSugarSpoons");
  return false;
}

bool isChaiAvailable() {
  int sugarKiBori = 2;
  int chaiKiPatti = 1;
  bool isGasAvailable = false;
  return sugarKiBori > 0 && chaiKiPatti > 0 && isGasAvailable;
}

hello() {}
