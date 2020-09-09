class Users {
  String name;
  int hours;
  String country;
  String badgeUrl;

  Users({this.name, this.hours, this.country, this.badgeUrl});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        name: json['name'],
        hours: json['hours'],
        country: json['country'],
        badgeUrl: json['badgeUrl']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['hours'] = this.hours;
    data['country'] = this.country;
    data['badgeUrl'] = this.badgeUrl;
    return data;
  }
}
