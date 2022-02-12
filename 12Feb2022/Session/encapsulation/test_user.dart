class FacebookUser {
  int _friendsCount = 0;
  set friendsCounter(int number) {
    if (number >= 0) {
      _friendsCount = number;
    }
  }
}
