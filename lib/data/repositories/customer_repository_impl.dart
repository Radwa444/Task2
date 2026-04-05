import 'package:task/data/models/customer_model.dart';
import 'package:task/domain/entities/customer.dart';
import 'package:task/domain/repositories/customer_repository.dart';

import '../database/database_helper.dart';

class CustomerRepositoryImpl  implements  CustomerRepository{

  final DatabaseHelper dbHelper;

  CustomerRepositoryImpl(this.dbHelper);
  @override
  Future<List<Customer>> getAllPersons() async {
    final db = await dbHelper.database;

    final result = await db.query('customers');

    return result.map((e) => CustomerModel.fromMap(e)).toList();

  }

  @override
  Future<int> insertPerson(Customer customer) async {
    final db= await dbHelper.database;
    final model=CustomerModel(id: customer.id, name: customer.name, mobile: customer.phone, address: customer.address);
    return await db.insert('customers', model.toMapping());
  }
  
}