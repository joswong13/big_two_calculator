class UserStats {
  int _id;
  double _totalWinnings;
  double _biggestWin;
  double _biggestLose;
  int _roundsPlayed;
  int _totalDoubleToOthers;
  int _totalDoubleToUser;
  int _totalTripleToOthers;
  int _totalTripleToUser;
  int _mostDoublesInAGameToOthers;
  int _mostDoublesInAGameToUser;
  int _mostTriplesInAGameToOthers;
  int _mostTriplesInAGameToUser;

  UserStats();

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "totalWinnings": totalWinnings,
      "biggestWin": biggestWin,
      "biggestLose": biggestLose,
      "roundsPlayed": roundsPlayed,
      "totalDoubleToOthers": totalDoubleToOthers,
      "totalDoubleToUser": totalDoubleToUser,
      "totalTripleToOthers": totalTripleToOthers,
      "totalTripleToUser": totalTripleToUser,
      "mostDoublesInAGameToOthers": mostDoublesInAGameToOthers,
      "mostDoublesInAGameToUser": mostDoublesInAGameToUser,
      "mostTriplesInAGameToOthers": mostTriplesInAGameToOthers,
      "mostTriplesInAGameToUser": mostTriplesInAGameToUser
    };
  }

  UserStats.fromDb(Map<String, dynamic> data) {
    this._id = data["id"];
    this._totalWinnings = data["totalWinnings"];
    this._biggestWin = data["biggestWin"];
    this._biggestLose = data["biggestLose"];
    this._roundsPlayed = data["roundsPlayed"];
    this._totalDoubleToOthers = data["totalDoubleToOthers"];
    this._totalDoubleToUser = data["totalDoubleToUser"];
    this._totalTripleToOthers = data["totalTripleToOthers"];
    this._totalTripleToUser = data["totalTripleToUser"];
    this._mostDoublesInAGameToOthers = data["mostDoublesInAGameToOthers"];
    this._mostDoublesInAGameToUser = data["mostDoublesInAGameToUser"];
    this._mostTriplesInAGameToOthers = data["mostTriplesInAGameToOthers"];
    this._mostTriplesInAGameToUser = data["mostTriplesInAGameToUser"];
  }

  UserStats.createEmptyUserStat() {
    this._totalWinnings = 0;
    this._biggestWin = 0;
    this._biggestLose = 0;
    this._roundsPlayed = 0;
    this._totalDoubleToOthers = 0;
    this._totalDoubleToUser = 0;
    this._totalTripleToOthers = 0;
    this._totalTripleToUser = 0;
    this._mostDoublesInAGameToOthers = 0;
    this._mostDoublesInAGameToUser = 0;
    this._mostTriplesInAGameToOthers = 0;
    this._mostTriplesInAGameToUser = 0;
  }

//--------------------------
  set id(id) {
    _id = id;
  }

  int get id {
    return _id;
  }

//--------------------------
  set totalWinnings(totalWinnings) {
    _totalWinnings = totalWinnings;
  }

  double get totalWinnings {
    return _totalWinnings;
  }

  //--------------------------
  set biggestWin(biggestWin) {
    _biggestWin = biggestWin;
  }

  double get biggestWin {
    return _biggestWin;
  }

  //--------------------------
  set biggestLose(biggestLose) {
    _biggestLose = biggestLose;
  }

  double get biggestLose {
    return _biggestLose;
  }

  //--------------------------
  set roundsPlayed(roundsPlayed) {
    _roundsPlayed = roundsPlayed;
  }

  int get roundsPlayed {
    return _roundsPlayed;
  }

//--------------------------
  set totalDoubleToOthers(totalDoubleToOthers) {
    _totalDoubleToOthers = totalDoubleToOthers;
  }

  int get totalDoubleToOthers {
    return _totalDoubleToOthers;
  }

  //--------------------------
  set totalDoubleToUser(totalDoubleToUser) {
    _totalDoubleToUser = totalDoubleToUser;
  }

  int get totalDoubleToUser {
    return _totalDoubleToUser;
  }

//--------------------------
  set totalTripleToOthers(totalTripleToOthers) {
    _totalTripleToOthers = totalTripleToOthers;
  }

  int get totalTripleToOthers {
    return _totalTripleToOthers;
  }

  //--------------------------
  set totalTripleToUser(totalTripleToUser) {
    _totalTripleToUser = totalTripleToUser;
  }

  int get totalTripleToUser {
    return _totalTripleToUser;
  }

  //--------------------------
  set mostDoublesInAGameToOthers(mostDoublesInAGameToOthers) {
    _mostDoublesInAGameToOthers = mostDoublesInAGameToOthers;
  }

  int get mostDoublesInAGameToOthers {
    return _mostDoublesInAGameToOthers;
  }

  //--------------------------
  set mostDoublesInAGameToUser(mostDoublesInAGameToUser) {
    _mostDoublesInAGameToUser = mostDoublesInAGameToUser;
  }

  int get mostDoublesInAGameToUser {
    return _mostDoublesInAGameToUser;
  }

  //--------------------------
  set mostTriplesInAGameToOthers(mostTriplesInAGameToOthers) {
    _mostTriplesInAGameToOthers = mostTriplesInAGameToOthers;
  }

  int get mostTriplesInAGameToOthers {
    return _mostTriplesInAGameToOthers;
  }

  //--------------------------
  set mostTriplesInAGameToUser(mostTriplesInAGameToUser) {
    _mostTriplesInAGameToUser = mostTriplesInAGameToUser;
  }

  int get mostTriplesInAGameToUser {
    return _mostTriplesInAGameToUser;
  }
}
