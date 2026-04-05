import 'package:task/domain/entities/customer.dart';

class CustomerModel extends Customer {
  CustomerModel({
    required int? id,
    required String name,
    required String mobile,
    required String address,
  }) : super(id: id, name: name, phone: mobile, address: address);
  Map<String, dynamic> toMapping() {
    return {"id": id, "name": name, "phone": phone, "address": address};
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      id: map["id"],
      name: map["name"],
      mobile: map["phone"],
      address: map["address"],
    );
  }
}
