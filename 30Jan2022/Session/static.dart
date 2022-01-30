import 'factory.dart';

main() {
  TalibEIlm.country = "Afghanistan";
  TalibEIlm.setMulk("China");
  TalibEIlm.country = "";
  TalibEIlm student = TalibEIlm("Ishaq", "12345", "123, karachi");
  print(student.naam);
  print(TalibEIlm.country);
  print(" ======== ");
  TalibEIlm student2 = TalibEIlm("Hassan", "123456", "125, karachi");
  print(student2.naam);
  print(TalibEIlm.country);
}

class TalibEIlm {
  String naam = "";
  String mobailNumber = "";
  String pata = "";
  static String country = "Pakistan";
  TalibEIlm(this.naam, this.mobailNumber, this.pata) {}

  static setMulk(String country) {
    if (country.isEmpty) {
      print("Ajeeb admi ho kuch to batao");
    } else {
      TalibEIlm.country = country;
      print("Name : $country");
    }
  }
}
