main() {
  ChaiWala newQuettaHotel = ChaiWala();
  newQuettaHotel.myIncome = 10;
  //newQuettaHotel.setIncome(newIncome);
  print(newQuettaHotel.getIncome);
}

class ChaiWala {
  int income = 0;
  set myIncome(int newIncome) {
    print("Hello world");
    if (newIncome < 0) {
      return;
    }
    income = newIncome;
  }

  int get getIncome {
    if (income > 10) {
      return 0;
    }
    return income;
  }

  mairiKamai(int kamai) {
    if (kamai < 0) {
      return;
    }
    income = kamai;
  }
}
