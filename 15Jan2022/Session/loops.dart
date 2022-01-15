void main() {
  // finite loop = depends on specific count/limit
  // increament = plus , decreament = minus
  // loop start 1; check codition if(trrue) {
  // agai jao}else{
  // ruk jao};

  // for (int startFrom = 1; startFrom <= 10; startFrom += 1) {
  //   print("Menai $startFrom bar likh lia h");
  // }

  List<String> friends = ["Ali", "Ahmed", "Hasan", "Owais", "Usama"];
  //int aliMeraDost = 0;
  //print(friends[aliMeraDost]);
  //print(friends[0]);
  // if( expression )
  //print(friends.length);
  // Pre inc
  // Post inc

  // int dost = 1;
  // int dostKaKiaHua = ++dost;
  // print(dostKaKiaHua);
  String achaDost = "Hasan";
  for (int dost = 0; dost < friends.length; dost++) {
    if (friends[dost] == achaDost) {
      print("Mera dost : ${friends[dost]}");
      break;
    }
  }
}

// infinite loop = never stop on specific count
