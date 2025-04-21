import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:intl/intl.dart';

class PantryItem {
  final String name;
  final String manufactureDate;
  final String expiryDetails;

  PantryItem({
    required this.name,
    required this.manufactureDate,
    required this.expiryDetails,
  });

  @override
  String toString() {
    return '$name | $manufactureDate | $expiryDetails';
  }
}

class PantryManagementScreen extends StatefulWidget {
  const PantryManagementScreen({super.key});

  @override
  _PantryManagementScreenState createState() => _PantryManagementScreenState();
}

class _PantryManagementScreenState extends State<PantryManagementScreen> {
  final SpeechToText _speechToText = SpeechToText();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _manufactureDateController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _expiryPeriodController = TextEditingController();

  List<PantryItem> pantryItems = [];
  bool isExpiryDate = true;
  String selectedExpiryUnit = 'Days';
  final List<String> expiryUnits = ['Days', 'Months', 'Years'];

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    bool available = await _speechToText.initialize();
    if (!available) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Speech recognition is not available')),
        );
      }
    }
  }

  Future<void> _startListening(TextEditingController controller, bool isDate) async {
    if (await _speechToText.hasPermission) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Recording started...')),
      );
      await _speechToText.listen(
        onResult: (result) {
          String text = result.recognizedWords;
          if (isDate) {
            text = _processSpokenDate(text);
          }
          setState(() {
            controller.text = text;
          });
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No permission for speech recognition')),
      );
    }
  }

  String _processSpokenDate(String input) {
    input = input.replaceAll(RegExp(r'\s+'), '');
    if (input.length == 8 && RegExp(r'^\d{8}$').hasMatch(input)) {
      String day = input.substring(0, 2);
      String month = input.substring(2, 4);
      String year = input.substring(4, 8);
      return '$day-$month-$year';
    }
    return input;
  }

  bool _isValidDate(String date) {
    try {
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      formatter.parseStrict(date);
      return true;
    } catch (e) {
      return false;
    }
  }

  String? _calculateExpiryDate(String manufactureDate, int period, String unit) {
    try {
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      DateTime date = formatter.parse(manufactureDate);
      switch (unit.toLowerCase()) {
        case 'days':
          date = date.add(Duration(days: period));
          break;
        case 'months':
          date = DateTime(date.year, date.month + period, date.day);
          break;
        case 'years':
          date = DateTime(date.year + period, date.month, date.day);
          break;
      }
      return formatter.format(date);
    } catch (e) {
      return null;
    }
  }

  void _addPantryItem() {
    final String name = _nameController.text.trim();
    final String manufactureDate = _manufactureDateController.text.trim();
    String expiryDetails;

    if (!_isValidDate(manufactureDate)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid manufacturing date')),
      );
      return;
    }

    if (isExpiryDate) {
      final String expiryDate = _expiryDateController.text.trim();
      if (!_isValidDate(expiryDate)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid expiry date')),
        );
        return;
      }

      // Parse the dates and compare them
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      DateTime mfgDate = formatter.parse(manufactureDate);
      DateTime expDate = formatter.parse(expiryDate);

      if (expDate.isBefore(mfgDate)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Expiry date must be after manufacturing date')),
        );
        return;
      }

      expiryDetails = 'Expiry Date: $expiryDate';
    } else {
      final String periodText = _expiryPeriodController.text.trim();
      if (periodText.isEmpty || int.tryParse(periodText) == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter a valid expiry period')),
        );
        return;
      }

      int period = int.parse(periodText);
      String? calculatedDate = _calculateExpiryDate(
        manufactureDate,
        period,
        selectedExpiryUnit,
      );

      expiryDetails = 'Expiry Period: $period $selectedExpiryUnit';
      if (calculatedDate != null) {
        expiryDetails += ' (Calculated Expiry Date: $calculatedDate)';
      }
    }

    setState(() {
      pantryItems.add(PantryItem(
        name: name,
        manufactureDate: manufactureDate,
        expiryDetails: expiryDetails,
      ));
    });
    _clearInputs();
  }


  void _clearInputs() {
    _nameController.clear();
    _manufactureDateController.clear();
    _expiryDateController.clear();
    _expiryPeriodController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pantry Management',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlue, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(_nameController, 'Item Name', Icons.fastfood),
              SizedBox(height: 16),
              _buildTextField(
                _manufactureDateController,
                'Manufacturing Date (dd-MM-yyyy)',
                Icons.calendar_today,
                isDate: true,
              ),
              SizedBox(height: 16),
              _buildExpiryOptions(),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _addPantryItem,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
                child: Text('Add Item', style: TextStyle(fontSize: 16)),
              ),
              SizedBox(height: 24),
              Text(
                'Pantry Items:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
              SizedBox(height: 8),
              _buildPantryList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool isDate = false}) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: Icon(icon, color: Colors.lightBlue),
            ),
          ),
        ),
        SizedBox(width: 8),
        IconButton(
          icon: Icon(Icons.mic, color: Colors.lightBlue),
          onPressed: () => _startListening(controller, isDate),
        ),
      ],
    );
  }

  Widget _buildExpiryOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Radio<bool>(
              value: true,
              groupValue: isExpiryDate,
              onChanged: (value) => setState(() => isExpiryDate = value!),
            ),
            Text('Expiry Date', style: TextStyle(fontSize: 16)),
            Radio<bool>(
              value: false,
              groupValue: isExpiryDate,
              onChanged: (value) => setState(() => isExpiryDate = value!),
            ),
            Text('Expiry Period', style: TextStyle(fontSize: 16)),
          ],
        ),
        if (isExpiryDate)
          _buildTextField(_expiryDateController, 'Expiry Date (dd-MM-yyyy)', Icons.calendar_today, isDate: true)
        else
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _expiryPeriodController,
                  decoration: InputDecoration(
                    labelText: 'Expiry Period',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.timer, color: Colors.blue),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 16),
              DropdownButton<String>(
                value: selectedExpiryUnit,
                items: expiryUnits.map((String unit) {
                  return DropdownMenuItem<String>(
                    value: unit,
                    child: Text(unit, style: TextStyle(fontSize: 16)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedExpiryUnit = newValue!;
                  });
                },
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildPantryList() {
    if (pantryItems.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'No items added yet.',
            style: TextStyle(fontSize: 16, color: Colors.lightBlue.shade800),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: pantryItems.length,
      itemBuilder: (context, index) {
        final item = pantryItems[index];
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: Icon(Icons.fastfood, color: Colors.lightBlue),
            title: Text(
              item.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade900,
              ),
            ),
            subtitle: Text(
              '${item.manufactureDate}\n${item.expiryDetails}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.teal.shade700,
              ),
            ),
            isThreeLine: true,
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.redAccent),
              onPressed: () => setState(() {
                pantryItems.removeAt(index);
              }),
            ),
          ),
        );
      },
    );
  }
}