class ErrorModel {
  ErrorModel({
      this.statusCode, 
      this.isSuccess, 
      this.message, 
      this.data,});

  ErrorModel.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    isSuccess = json['isSuccess'];
    message = json['message'];
    data = json['data'];
  }
  num? statusCode;
  bool? isSuccess;
  String? message;
  dynamic data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['isSuccess'] = isSuccess;
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}