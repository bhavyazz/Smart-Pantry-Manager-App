import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'addpage.dart';

// Custom text formatter for uppercase input
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

// Data models
class FamilyMember {
  final String id;
  final String name;
  final String role;
  final String addedBy;
  final DateTime joinDate;
  final String? profilePicture;
  final bool isActive;
  final bool isAdmin;

  FamilyMember({
    required this.id,
    required this.name,
    required this.role,
    required this.addedBy,
    required this.joinDate,
    this.profilePicture,
    this.isActive = true,
    this.isAdmin = false,
  });
}

class Activity {
  final String id;
  final String memberId;
  final String memberName;
  final String description;
  final DateTime timestamp;
  final ActivityType type;

  Activity({
    required this.id,
    required this.memberId,
    required this.memberName,
    required this.description,
    required this.timestamp,
    required this.type,
  });
}

class PantryItem {
  final String id;
  final String name;
  final DateTime addedDate;
  final String addedBy;
  final String re;

  PantryItem({
    required this.id,
    required this.name,
    required this.addedDate,
    required this.addedBy,
    required this.re,
  });
}

enum ActivityType {
  join,
  pantry,
  shopping,
  household,
  other
}

class FamilyUserPage extends StatefulWidget {
  const FamilyUserPage({super.key});
  @override
  _FamilyPageState createState() => _FamilyPageState();
}

class _FamilyPageState extends State<FamilyUserPage> with SingleTickerProviderStateMixin {
  final TextEditingController _familyCodeController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  bool _hasJoinedFamily = false;

  final String _familyCode = 'ABC123';

  List<FamilyMember> familyMembers = [
      FamilyMember(
      id: '1',
      name: 'Bhavyasree',
      role: 'Parent',
      addedBy: 'system',
      joinDate: DateTime.now().subtract(const Duration(days: 30)),
      isAdmin: true,
    ),

  ];
  List<Activity> activities = [];
  List<FamilyMember> filteredFamilyMembers = [];
  List<PantryItem> pantryItems = [
    PantryItem(
      id: '1',
      name: 'tomato',
      addedDate: DateTime.now(),
      addedBy: 'Bhavyasree',
      re:'3',
    ),PantryItem(
      id: '2',
      name: 'bread',
      addedDate: DateTime.now(),
      addedBy: 'Bhavyasree',
      re:'7',
    ),
    PantryItem(
      id: '3',
      name: 'milk',
      addedDate: DateTime.now(),
      addedBy: 'Bhavyasree',
      re:'1',
    ),
    PantryItem(
      id: '4',
      name: 'eggs',
      addedDate: DateTime.now(),
      addedBy: 'Bhavyasree',
      re:'10',
    ),
     PantryItem(
      id: '5',
      name: 'cheese',
      addedDate: DateTime.now(),
      addedBy: 'Bhavyasree',
      re:'5',
    ),
     PantryItem(
      id: '6',
      name: 'apples',
      addedDate: DateTime.now(),
      addedBy: 'Bhavyasree',
      re:'6',
    ),
     PantryItem(
      id: '6',
      name: 'bananas',
      addedDate: DateTime.now(),
      addedBy: 'Bhavyasree',
      re:'0',
    ),
     PantryItem(
      id: '7',
      name: 'yogurt',
      addedDate: DateTime.now(),
      addedBy: 'Bhavyasree',
      re:'0',
    ),

  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    filteredFamilyMembers = List.from(familyMembers);
    _searchController.addListener(_filterFamilyMembers);
  }

  void _filterFamilyMembers() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredFamilyMembers = familyMembers
          .where((member) =>
      member.name.toLowerCase().contains(query) ||
          member.role.toLowerCase().contains(query))
          .toList();
    });
  }

  void _showJoinFamilyDialog() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController codeController = TextEditingController();
    final TextEditingController relationController = TextEditingController();
    bool isValid = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Join Family'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Your Name',
                        hintText: 'Enter your full name',
                        prefixIcon: Icon(Icons.person),
                      ),
                      textCapitalization: TextCapitalization.words,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: codeController,
                      decoration: InputDecoration(
                        labelText: 'Family Code',
                        hintText: 'Enter 6-digit family code',
                        prefixIcon: const Icon(Icons.home),
                        errorText: codeController.text.isNotEmpty && !isValidFamilyCode(codeController.text)
                            ? 'Invalid family code format'
                            : null,
                      ),
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                        FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]')),
                        LengthLimitingTextInputFormatter(6),
                      ],
                      onChanged: (value) {
                        setState(() {
                          isValid = isValidFamilyCode(value);
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: relationController,
                      decoration: const InputDecoration(
                        labelText: 'Your Relation',
                        hintText: 'E.g., Parent, Child, Spouse',
                        prefixIcon: Icon(Icons.family_restroom),
                      ),
                      textCapitalization: TextCapitalization.words,
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isEmpty ||
                        !isValidFamilyCode(codeController.text) ||
                        relationController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill all fields correctly'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    if (codeController.text != _familyCode) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Invalid family code'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    final newMember = FamilyMember(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      name: nameController.text.trim(),
                      role: relationController.text.trim(),
                      addedBy: 'Self',
                      joinDate: DateTime.now(),
                      isAdmin: familyMembers.isEmpty, // First member becomes admin
                    );

                    setState(() {
                      familyMembers.add(newMember);
                      filteredFamilyMembers = List.from(familyMembers);
                    });

                    _addActivity(Activity(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      memberId: newMember.id,
                      memberName: newMember.name,
                      description: '${newMember.name} joined the family',
                      timestamp: DateTime.now(),
                      type: ActivityType.join,
                    ));

                    Navigator.of(context).pop();

                    setState(() {
                      _hasJoinedFamily = true;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Successfully joined family!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  child: const Text('Join'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  bool isValidFamilyCode(String code) {
    final RegExp codePattern = RegExp(r'^[A-Z]{3}[0-9]{3}$');
    return codePattern.hasMatch(code);
  }

  void _addActivity(Activity activity) {
    setState(() {
      activities.insert(0, activity);
    });
  }

  String _formatDate(DateTime date) {
    final difference = DateTime.now().difference(date);
    if (difference.inDays < 1) {
      return 'Today';
    } else if (difference.inDays < 2) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasJoinedFamily) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Family Management'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.family_restroom,
                size: 100,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to Family Management',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Join your family group to get started',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: _showJoinFamilyDialog,
                icon: const Icon(Icons.group_add),
                label: const Text('Join Family'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Management'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Members'),
            Tab(text: 'Activities'),
            Tab(text: 'Pantry'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildMembersTab(),
          _buildActivitiesTab(),
          _buildPantryTab(),
        ],
      ),
    );
  }

  Widget _buildMembersTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search Members',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredFamilyMembers.length,
            itemBuilder: (context, index) {
              final member = filteredFamilyMembers[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 2,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    child: Text(
                      member.name[0].toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  title: Text(member.name),
                  subtitle: Text(
                    '${member.role} • Added by ${member.addedBy}\nJoined ${_formatDate(member.joinDate)}',
                    maxLines: 2,
                  ),
                  isThreeLine: true,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActivitiesTab() {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final activity = activities[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: _getActivityIcon(activity.type),
            title: Text(activity.description),
            subtitle: Text(
              '${activity.memberName} • ${_formatTimestamp(activity.timestamp)}',
            ),
          ),
        );
      },
    );
  }

  Widget _buildPantryTab() {
    return Stack(
      children: [
        ListView.builder(
          itemCount: pantryItems.length,
          itemBuilder: (context, index) {
            final item = pantryItems[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green.shade100,
                  child: Icon(Icons.kitchen, color: Colors.green.shade700),
                ),
                title: Text(item.name),
                subtitle: Text(
                  'Added by ${item.addedBy}\n expirationdays ${item.re}',
                ),
                trailing: Text(
                  _formatDate(item.addedDate),
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Addpage()),
              );
            },
            backgroundColor: Colors.blue,
            tooltip: 'Add Pantry Item',
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }

  Widget _getActivityIcon(ActivityType type) {
    IconData iconData;
    Color iconColor;

    switch (type) {
      case ActivityType.join:
        iconData = Icons.person_add;
        iconColor = Colors.green;
        break;
      case ActivityType.pantry:
        iconData = Icons.kitchen;
        iconColor = Colors.orange;
        break;
      case ActivityType.shopping:
        iconData = Icons.shopping_cart;
        iconColor = Colors.blue;
        break;
      case ActivityType.household:
        iconData = Icons.home;
        iconColor = Colors.purple;
        break;
      case ActivityType.other:
        iconData = Icons.event_note;
        iconColor = Colors.grey;
        break;
    }

    return CircleAvatar(
      backgroundColor: iconColor.withOpacity(0.2),
      child: Icon(iconData, color: iconColor),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final difference = DateTime.now().difference(timestamp);
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _familyCodeController.dispose();
    _tabController.dispose();
    super.dispose();
  }
}