typedef bool meraAdmissionWalaFunction(String name);

void main() {
  meraAdmissionWalaFunction admit = takeAdmission;
  print(admit("Ishaq"));
}

bool takeAdmission(String name) {
  print("$name is taking admission in xyz session");
  return true;
}

void onClick() {}
