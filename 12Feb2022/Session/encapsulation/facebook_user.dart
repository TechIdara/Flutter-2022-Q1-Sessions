class FacebookUser {
  int _friendsCount = 0;
  set friendsCount(int number) {
    if (number >= 0) {
      _friendsCount = number;
    }
  }

  int get friendsCount {
    return _friendsCount;
  }

  login() {
    _friendsCount = 0;
  }
}

void _hello() {
  //Checking private accessibility! :D
  FacebookUser user = FacebookUser();
  user._friendsCount = -1;
}
