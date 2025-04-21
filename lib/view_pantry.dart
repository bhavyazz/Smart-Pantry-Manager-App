import 'package:flutter/material.dart';

class ViewPantryPage extends StatefulWidget {
  const ViewPantryPage({super.key});

  @override
  _ViewPantryPageState createState() => _ViewPantryPageState();
}

class _ViewPantryPageState extends State<ViewPantryPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> pantryItems = [
    {'name': 'Tomatoes', 'expirationDays': 3},
    {'name': 'Bread', 'expirationDays': 7},
    {'name': 'Milk', 'expirationDays': 1},
    {'name': 'Eggs', 'expirationDays': 10},
    {'name': 'Cheese', 'expirationDays': 5},
    {'name': 'Apples', 'expirationDays': 6},
    {'name': 'Bananas', 'expirationDays': 0}, // Expired
    {'name': 'Yogurt', 'expirationDays': -1}, // Expired
  ];
  List<Map<String, dynamic>> filteredItems = [];
  bool showExpiringSoonOnly = false;

  @override
  void initState() {
    super.initState();
    filteredItems = pantryItems; // Initially show all items
  }

  void _filterItems() {
    setState(() {
      filteredItems = pantryItems.where((item) {
        final itemName = item['name'] as String;
        final query = _searchController.text.toLowerCase();
        return itemName.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _filterByExpiration() {
    setState(() {
      showExpiringSoonOnly = !showExpiringSoonOnly;
      if (showExpiringSoonOnly) {
        filteredItems = pantryItems.where((item) {
          return (item['expirationDays'] as int) <= 5;
        }).toList();
      } else {
        filteredItems = pantryItems;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: const Text(
          'Pantry Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: PantrySearchDelegate(
                  pantryItems: pantryItems,
                  onSearch: _filterItems,
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(
              showExpiringSoonOnly ? Icons.filter_alt_off : Icons.filter_alt,
            ),
            onPressed: _filterByExpiration,
          ),
        ],
      ),
      body: Container(
        color: Colors.blue.shade50,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        child: filteredItems.isEmpty
            ? Center(
                child: Text(
                  'No items match your search or filter.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue.shade700,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  final expirationDays = item['expirationDays'] as int;
                  return _buildPantryItem(
                    itemName: item['name'] as String,
                    expirationDays: expirationDays,
                  );
                },
              ),
      ),
    );
  }

  Widget _buildPantryItem({
    required String itemName,
    required int expirationDays,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: expirationDays > 0 ? Colors.blue.shade300 : Colors.red.shade300,
          width: 1.5,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        title: Text(
          itemName,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          expirationDays > 0
              ? 'Expires in $expirationDays days'
              : 'Expired ${expirationDays.abs()} days ago',
          style: TextStyle(
            fontSize: 12,
            color: expirationDays > 0 ? Colors.blue.shade700 : Colors.red.shade600,
          ),
        ),
        trailing: expirationDays > 5
            ? Icon(Icons.info_outline, color: Colors.grey.shade600, size: 20) // Neutral icon
            : expirationDays > 0
                ? Icon(Icons.hourglass_bottom, color: Colors.orange.shade600, size: 20) // Expiring soon
                : Icon(Icons.warning_amber_rounded, color: Colors.red.shade400, size: 20), // Expired
      ),
    );
  }
}

class PantrySearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> pantryItems;
  final VoidCallback onSearch;

  PantrySearchDelegate({required this.pantryItems, required this.onSearch});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          onSearch();
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = pantryItems.where((item) {
      final itemName = item['name'] as String;
      return itemName.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        final expirationDays = item['expirationDays'] as int;
        return ListTile(
          title: Text(item['name']),
          subtitle: expirationDays > 0
              ? Text('Expires in $expirationDays days')
              : Text('Expired ${expirationDays.abs()} days ago'),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = pantryItems.where((item) {
      final itemName = item['name'] as String;
      return itemName.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final item = suggestions[index];
        final expirationDays = item['expirationDays'] as int;
        return ListTile(
          title: Text(item['name']),
          subtitle: expirationDays > 0
              ? Text('Expires in $expirationDays days')
              : Text('Expired ${expirationDays.abs()} days ago'),
        );
      },
    );
  }
}