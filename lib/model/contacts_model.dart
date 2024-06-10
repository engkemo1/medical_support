class ComplaintsModel {
  int? id;
  String? name;
  String? email;
  String? type;
  String? message;
  String? createdAt;
  String? updatedAt;

  ComplaintsModel(
      {this.id,
        this.name,
        this.email,
        this.type,
        this.message,
        this.createdAt,
        this.updatedAt});

  ComplaintsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    type = json['type'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['type'] = this.type;
    data['message'] = this.message;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
