void main() {
  Function aikKaam = friesWala;
  bool myValue = aikKaam();
  print(myValue);
  samanLanaiWala(aikKaam);
}

bool friesWala() {
  return true;
}

samanLanaiWala(Function kaam) {
  bool myRes = kaam();
}
