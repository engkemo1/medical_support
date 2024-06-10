class OrderModel {
  int? id;
  int? userId;
  String? status;
  String? address;
  String? total;
  String? createdAt;
  String? updatedAt;
  List<OrderProducts>? orderProducts;

  OrderModel(
      {this.id,
        this.userId,
        this.status,
        this.address,
        this.total,
        this.createdAt,
        this.updatedAt,
        this.orderProducts});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    status = json['status'];
    address = json['address'];
    total = json['total'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['order_products'] != null) {
      orderProducts = <OrderProducts>[];
      json['order_products'].forEach((v) {
        orderProducts!.add(new OrderProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['address'] = this.address;
    data['total'] = this.total;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.orderProducts != null) {
      data['order_products'] =
          this.orderProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderProducts {
  int? id;
  int? orderId;
  String? name;
  int? quantity;
  String? price;
  String? createdAt;
  String? updatedAt;

  OrderProducts(
      {this.id,
        this.orderId,
        this.name,
        this.quantity,
        this.price,
        this.createdAt,
        this.updatedAt});

  OrderProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
