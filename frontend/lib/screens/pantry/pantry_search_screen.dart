import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_management_frontend/bloc/pantry/pantry_bloc.dart';
import 'package:grocery_management_frontend/models/pantry_item.dart';

class PantrySearchScreen extends StatefulWidget {
  const PantrySearchScreen({super.key});

  @override
  State<PantrySearchScreen> createState() => _PantrySearchScreenState();
}

class _PantrySearchScreenState extends State<PantrySearchScreen> {
  final _searchController = TextEditingController();
  List<PantryItem> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    // Initially, show all items
    _filteredItems = context.read<PantryBloc>().state.items;
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final searchTerm = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = context.read<PantryBloc>().state.items.where((item) {
        return item.name.toLowerCase().contains(searchTerm);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search pantry...',
            border: InputBorder.none,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredItems.length,
        itemBuilder: (context, index) {
          final item = _filteredItems[index];
          return ListTile(
            title: Text(item.name),
            onTap: () {
              // Return the selected item to the previous screen
              Navigator.of(context).pop(item);
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
