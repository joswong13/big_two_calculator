class User {
  int _id;
  String _name;
  int _dateAdded;
  int _lastPlayed;
  int _played;

  User();

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name, "dateAdded": dateAdded, "lastPlayed": lastPlayed, "played": played};
  }

  User.fromDb(Map<String, dynamic> data) {
    this._id = data["id"];
    this._name = data["name"];
    this._dateAdded = data["dateAdded"];
    this._lastPlayed = data["lastPlayed"];
    this._played = data["played"];
  }

  User.newUser(String name, int dateAdded) {
    this._name = name;
    this._dateAdded = dateAdded;
    this._lastPlayed = 0;
    this._played = 0;
  }

  set id(id) {
    _id = id;
  }

  set name(name) {
    _name = name;
  }

  set dateAdded(dateAdded) {
    _dateAdded = dateAdded;
  }

  set lastPlayed(lastPlayed) {
    _lastPlayed = lastPlayed;
  }

  set played(played) {
    _played = played;
  }

  int get id {
    return _id;
  }

  String get name {
    return _name;
  }

  int get dateAdded {
    return _dateAdded;
  }

  int get lastPlayed {
    return _lastPlayed;
  }

  int get played {
    return _played;
  }
}
