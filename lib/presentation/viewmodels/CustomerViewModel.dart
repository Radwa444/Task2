import 'package:task/domain/entities/customer.dart';
import 'package:task/domain/repositories/customer_repository.dart';

class CustomerViewModel {
   final CustomerRepository repository;
  CustomerViewModel(this.repository);

  Future<void> saveCustomers(String name,String phone , String address) async{
    final customer=Customer(name: name, address: address, phone: phone);
    repository.insertPerson(customer);

   }

}