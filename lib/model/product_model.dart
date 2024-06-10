class ProductModel {
  String? name;
  String? image;
  var categoryId;
  String? price;
  String? type;
  String? description;
  String? updatedAt;
  String? createdAt;
  int? id;

  ProductModel(
      {this.name,
        this.image,
        this.categoryId,
        this.price,
        this.type,
        this.description,
        this.updatedAt,
        this.createdAt,
        this.id});

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    categoryId = json['category_id'];
    price = json['price'];
    type = json['type'];
    description = json['description'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['category_id'] = this.categoryId;
    data['price'] = this.price;
    data['type'] = this.type;
    data['description'] = this.description;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
