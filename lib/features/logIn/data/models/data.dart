class Data {
  Data({
      this.isAuthenticated, 
      this.id, 
      this.email, 
      this.username, 
      this.token,});

  Data.fromJson(dynamic json) {
    isAuthenticated = json['isAuthenticated'];
    id = json['id'];
    email = json['email'];
    username = json['username'];
    token = json['token'];
  }
  bool? isAuthenticated;
  String? id;
  String? email;
  String? username;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isAuthenticated'] = isAuthenticated;
    map['id'] = id;
    map['email'] = email;
    map['username'] = username;
    map['token'] = token;
    return map;
  }

}