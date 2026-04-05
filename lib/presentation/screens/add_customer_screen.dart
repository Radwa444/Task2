import 'package:flutter/material.dart';
import 'package:task/data/repositories/customer_repository_impl.dart';
import 'package:task/presentation/viewmodels/CustomerViewModel.dart';
import '../../data/database/database_helper.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();

  late CustomerViewModel viewModel;

  @override
  void initState() {
    super.initState();

    final repo = CustomerRepositoryImpl(DatabaseHelper.instance);
    viewModel = CustomerViewModel(repo);
  }

  void save() async {

    await viewModel.saveCustomers(
      nameController.text,
      addressController.text,
      phoneController.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Saved")),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Add Person")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: "Address"),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: "Phone"),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: save,
              child: const Text("Save"),
            )

          ],
        ),
      ),
    );
  }
}