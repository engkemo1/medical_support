class DoctorModel {
  int? id;
  int? categoryId;
  String? name;
  String? image;
  String? description;
  String? price;
  String? type;
  String? createdAt;
  String? updatedAt;

  DoctorModel(
      {this.id,
        this.categoryId,
        this.name,
        this.image,
        this.description,
        this.price,
        this.type,
        this.createdAt,
        this.updatedAt});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['price'] = this.price;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
