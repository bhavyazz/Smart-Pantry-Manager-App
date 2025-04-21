import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'fruit.dart';

class ShelfLifeHomePage extends StatefulWidget {
  const ShelfLifeHomePage({super.key});

  @override
  _ShelfLifeHomePageState createState() => _ShelfLifeHomePageState();
}

class _ShelfLifeHomePageState extends State<ShelfLifeHomePage> {
  List<FruitVeg> fruitVegList = [];
  final TextEditingController searchController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String? selectedStorageCondition;
  String? selectedState;
  String? selectedFruitOrVeg;
  String shelfLife = '';
  String expiryDate = '';
  List<String> filteredFruitsAndVeggies = [];

  // Define theme colors
  final Color primaryColor = Color(0xFF1976D2);  // Material Blue
  final Color secondaryColor = Color(0xFF2196F3); // Lighter Blue
  final Color accentColor = Color(0xFF64B5F6);    // Even Lighter Blue
  final Color backgroundColor = Color(0xFFF5F5F5); // Light Grey Background

  @override
  void initState() {
    super.initState();
    fruitVegList = initializeFruitVegList();
    filteredFruitsAndVeggies = getUniqueFruitVegNames(fruitVegList);
  }

  void filterSearchResults(String query) {
    setState(() {
      filteredFruitsAndVeggies = fruitVegList
          .map((item) => item.name)
          .where((name) => name.toLowerCase().contains(query.toLowerCase()))
          .toSet()
          .toList();
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: primaryColor,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        dateController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  void calculateShelfLife() {
    if (selectedFruitOrVeg == null ||
        selectedStorageCondition == null ||
        selectedState == null ||
        dateController.text.isEmpty) {
      setState(() {
        shelfLife = 'Please fill all fields';
        expiryDate = '';
      });
      return;
    }

    final matchingFruitVeg = fruitVegList.firstWhere(
          (fv) => fv.name.toLowerCase() == selectedFruitOrVeg!.toLowerCase(),
      orElse: () => FruitVeg('No match', '', '', ''),
    );

    if (matchingFruitVeg.name == 'No match') {
      setState(() {
        shelfLife = 'No data available';
        expiryDate = '';
      });
      return;
    }

    final matchingConditionState = fruitVegList.firstWhere(
          (data) =>
      data.name.toLowerCase() == selectedFruitOrVeg!.toLowerCase() &&
          data.storageCondition.toLowerCase() == selectedStorageCondition!.toLowerCase() &&
          data.state.toLowerCase() == selectedState!.toLowerCase(),
      orElse: () => FruitVeg('No match', '', '', ''),
    );

    if (matchingConditionState.name == 'No match') {
      setState(() {
        shelfLife = 'No data available for this condition and state';
        expiryDate = '';
      });
      return;
    }

    final shelfLifeDays = int.tryParse(matchingConditionState.shelfLife) ?? 0;
    final purchaseDate = DateFormat('dd-MM-yyyy').parse(dateController.text);
    final expiry = purchaseDate.add(Duration(days: shelfLifeDays));

    setState(() {
      shelfLife = '${matchingConditionState.shelfLife} days';
      expiryDate = DateFormat('dd-MM-yyyy').format(expiry);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Shelf Life Predictor',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product Details',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(height: 20),
                        Autocomplete<String>( 
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            return filteredFruitsAndVeggies.where((fruit) =>
                                fruit.toLowerCase().contains(textEditingValue.text.toLowerCase()));
                          },
                          onSelected: (String selection) {
                            setState(() {
                              selectedFruitOrVeg = selection;
                            });
                          },
                          fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
                            return TextField(
                              controller: controller,
                              focusNode: focusNode,
                              onEditingComplete: onEditingComplete,
                              onChanged: filterSearchResults,
                              decoration: InputDecoration(
                                labelText: 'Search Fruit/Vegetable',
                                labelStyle: TextStyle(color: primaryColor),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: primaryColor, width: 2),
                                ),
                                prefixIcon: Icon(Icons.search, color: primaryColor),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Storage Information',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            hint: Text('Select Storage Condition'),
                            value: selectedStorageCondition,
                            underline: SizedBox(),
                            onChanged: (value) {
                              setState(() {
                                selectedStorageCondition = value;
                              });
                            },
                            items: ['Room Temperature', 'Refrigerator', 'Freezer'].map((condition) {
                              return DropdownMenuItem<String>(
                                value: condition,
                                child: Text(condition),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            hint: Text('Select State'),
                            value: selectedState,
                            underline: SizedBox(),
                            onChanged: (value) {
                              setState(() {
                                selectedState = value;
                              });
                            },
                            items: ['Fresh and Raw', 'Ripe but Still Good', 'Slightly Overripe']
                                .map((state) {
                              return DropdownMenuItem<String>(
                                value: state,
                                child: Text(state),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Purchase Date',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: AbsorbPointer(
                            child: TextField(
                              controller: dateController,
                              decoration: InputDecoration(
                                labelText: 'Enter Purchase Date (dd-MM-yyyy)',
                                labelStyle: TextStyle(color: primaryColor),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: primaryColor, width: 2),
                                ),
                                prefixIcon: Icon(Icons.calendar_today, color: primaryColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: calculateShelfLife,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 4,
                    ),
                    child: Text(
                      'Calculate Shelf Life',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,  // Set text color to white
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                if (shelfLife.isNotEmpty)
                  Text(
                    'Shelf Life: $shelfLife',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                if (expiryDate.isNotEmpty)
                  Text(
                    'Expiry Date: $expiryDate',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
