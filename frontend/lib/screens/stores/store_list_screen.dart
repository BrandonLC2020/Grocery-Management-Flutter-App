import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_management_frontend/bloc/store/store_bloc.dart';

class StoreListScreen extends StatelessWidget {
  const StoreListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stores'),
      ),
      body: BlocBuilder<StoreBloc, StoreState>(
        builder: (context, state) {
          if (state.status == StoreStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == StoreStatus.failure) {
            return const Center(child: Text('Failed to fetch stores'));
          }
          if (state.stores.isEmpty) {
            return const Center(child: Text('No stores found.'));
          }
          return ListView.builder(
            itemCount: state.stores.length,
            itemBuilder: (context, index) {
              final store = state.stores[index];
              return ListTile(
                title: Text(store.name),
                subtitle: Text(store.address ?? 'No address'),
                trailing: Text('${store.tripCount} trips'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddStoreDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddStoreDialog(BuildContext context) {
    final nameController = TextEditingController();
    final addressController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Add Store'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter a name' : null,
                ),
                TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(labelText: 'Address'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<StoreBloc>().add(
                        AddStore(
                          name: nameController.text,
                          address: addressController.text,
                        ),
                      );
                  Navigator.of(dialogContext).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
