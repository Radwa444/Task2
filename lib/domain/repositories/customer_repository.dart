import 'package:task/domain/entities/customer.dart';

abstract class CustomerRepository {

  Future<int> insertPerson(Customer person);

  Future<List<Customer>> getAllPersons();
}