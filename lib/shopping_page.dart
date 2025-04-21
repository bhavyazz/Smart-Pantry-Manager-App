import 'package:flutter/material.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  _ShoppingListPageState createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _itemController = TextEditingController();
  
  // List of shopping items with a 'done' status
  List<Map<String, dynamic>> shoppingItems = [
    {'name': 'Milk', 'isDone': false},
    {'name': 'Bread', 'isDone': false},
    {'name': 'Eggs', 'isDone': false},
    {'name': 'Fruits', 'isDone': false},
    {'name': 'Vegetables', 'isDone': false},
  ];
  List<Map<String, dynamic>> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = List.from(shoppingItems); // Initialize filtered list
    _searchController.addListener(_filterItems); // Filter items when typing
  }

  // Filter items based on search query
  void _filterItems() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredItems = shoppingItems
          .where((item) => item['name'].toLowerCase().contains(query))
          .toList();
    });
  }

  // Add item to the shopping list
  void _addItem() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Item'),
          content: TextField(
            controller: _itemController,
            decoration: const InputDecoration(
              hintText: 'Enter Item Name',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_itemController.text.isNotEmpty) {
                  setState(() {
                    shoppingItems.add({'name': _itemController.text, 'isDone': false});
                    filteredItems.add({'name': _itemController.text, 'isDone': false});
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Item "${_itemController.text}" added!')),
                  );
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  // Delete an item from the shopping list
  void _deleteItem(int index) {
    setState(() {
      shoppingItems.removeAt(index);
      filteredItems.removeAt(index);
    });
  }

  // Toggle the 'done' status of an item
  void _toggleItemStatus(int index) {
    setState(() {
      filteredItems[index]['isDone'] = !filteredItems[index]['isDone'];
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _itemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Shopping List',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4FC3F7), Color(0xFF0288D1)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB3E5FC), Color(0xFF81D4FA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Shopping Items',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search Items',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        filteredItems[index]['name'],
                        style: TextStyle(
                          decoration: filteredItems[index]['isDone']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              filteredItems[index]['isDone']
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                            ),
                            onPressed: () => _toggleItemStatus(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _deleteItem(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
