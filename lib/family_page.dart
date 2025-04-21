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

  FamilyMember copyWith({
    String? name,
    String? role,
    bool? isActive,
    bool? isAdmin,
  }) {
    return FamilyMember(
      id: id,
      name: name ?? this.name,
      role: role ?? this.role,
      addedBy: addedBy,
      joinDate: joinDate,
      profilePicture: profilePicture,
      isActive: isActive ?? this.isActive,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }
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

class FamilyPage extends StatefulWidget {
  const FamilyPage({super.key});

  @override
  _FamilyPageState createState() => _FamilyPageState();
}

class _FamilyPageState extends State<FamilyPage> with SingleTickerProviderStateMixin {
  final TextEditingController _familyCodeController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;

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

    _addActivity(Activity(
      id: '1',
      memberId: '1',
      memberName: 'Bhavyasree',
      description: 'Family created',
      timestamp: DateTime.now().subtract(const Duration(days: 30)),
      type: ActivityType.join,
    ));
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

  void _navigateToAddPage() async {
    final result = await Navigator.pushNamed(context, '/add-pantry-item');
    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        pantryItems.add(PantryItem(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: result['name'],
          addedDate: result['addedDate'],
          addedBy: result['addedBy'],
          re:result['re'],
        ));

        _addActivity(Activity(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          memberId: '1', // Replace with actual user ID
          memberName: result['addedBy'],
          description: 'Added ${result['name']} to pantry expirationdays ${result['re']}', 
          timestamp: DateTime.now(),
          type: ActivityType.pantry,
        ));
      });
    }
  }

  // Keep all existing methods from previous code
  bool isValidFamilyCode(String code) {
    final RegExp codePattern = RegExp(r'^[A-Z]{3}[0-9]{3}$');
    return codePattern.hasMatch(code);
  }

  void _inviteFamilyMember() {
    // Keep existing implementation
  }

  void _showMemberDetailsDialog({FamilyMember? existingMember}) {
    // Keep existing implementation
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

  void _showManagePermissionsDialog(FamilyMember member) {
    // Keep existing implementation
  }

  void _showRemoveMemberDialog(FamilyMember member) {
    // Keep existing implementation
  }

  @override
  Widget build(BuildContext context) {
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
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: _inviteFamilyMember,
            tooltip: 'Invite Member',
          ),
        ],
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
    // Keep existing implementation
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
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue.shade100,
                        child: Text(
                          member.name[0].toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      if (member.isAdmin)
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.admin_panel_settings,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                  title: Row(
                    children: [
                      Text(member.name),
                      if (member.isAdmin)
                        const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Chip(
                            label: Text('Admin'),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            labelStyle: TextStyle(fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                  subtitle: Text(
                    '${member.role} • Added by ${member.addedBy}\nJoined ${_formatDate(member.joinDate)}',
                    maxLines: 2,
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: ListTile(
                          leading: Icon(Icons.edit),
                          title: Text('Edit Details'),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                      if (member.isAdmin)
                        const PopupMenuItem(
                          value: 'manage',
                          child: ListTile(
                            leading: Icon(Icons.admin_panel_settings),
                            title: Text('Manage Permissions'),
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      const PopupMenuItem(
                        value: 'remove',
                        child: ListTile(
                          leading: Icon(Icons.person_remove, color: Colors.red),
                          title: Text('Remove Member', style: TextStyle(color: Colors.red)),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                    onSelected: (value) {
                      if (value == 'edit') {
                        _showMemberDetailsDialog(existingMember: member);
                      } else if (value == 'manage') {
                        _showManagePermissionsDialog(member);
                      } else if (value == 'remove') {
                        _showRemoveMemberDialog(member);
                      }
                    },
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
    } else {
      return '${difference.inDays}d ago';
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