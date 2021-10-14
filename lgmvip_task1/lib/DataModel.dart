class CovidData {
  String _districtName;
  int _active;
  int _recovered;
  int _confirmed;
  int _deceased;

  CovidData(this._districtName, this._active, this._confirmed,
      this._recovered, this._deceased);

  int get deceased => _deceased;

  int get confirmed => _confirmed;

  int get recovered => _recovered;

  int get active => _active;

  String get districtName => _districtName;
}
