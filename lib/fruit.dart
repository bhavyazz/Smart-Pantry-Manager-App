class FruitVeg {
  final String name;
  final String storageCondition;
  final String state;
  final String shelfLife;

  FruitVeg(this.name, this.storageCondition, this.state, this.shelfLife);
}

List<FruitVeg> initializeFruitVegList() {
  return [
    // Cauliflower
    FruitVeg("Cauliflower", "Room Temperature", "Fresh and Raw", "7"),
    FruitVeg("Cauliflower", "Room Temperature", "Ripe but Still Good", "5"),
    FruitVeg("Cauliflower", "Room Temperature", "Slightly Overripe", "3"),
    FruitVeg("Cauliflower", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Cauliflower", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Cauliflower", "Freezer", "Slightly Overripe", "10"),
    FruitVeg("Cauliflower", "Refrigerator", "Fresh and Raw", "14"),
    FruitVeg("Cauliflower", "Refrigerator", "Ripe but Still Good", "7"),
    FruitVeg("Cauliflower", "Refrigerator", "Slightly Overripe", "4"),

    // Peas
    FruitVeg("Peas", "Room Temperature", "Fresh and Raw", "5"),
    FruitVeg("Peas", "Room Temperature", "Ripe but Still Good", "3"),
    FruitVeg("Peas", "Room Temperature", "Slightly Overripe", "2"),
    FruitVeg("Peas", "Freezer", "Fresh and Raw", "90"),
    FruitVeg("Peas", "Freezer", "Ripe but Still Good", "60"),
    FruitVeg("Peas", "Freezer", "Slightly Overripe", "30"),
    FruitVeg("Peas", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Peas", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Peas", "Refrigerator", "Slightly Overripe", "3"),

    // Bitter Gourd
    FruitVeg("Bitter Gourd", "Room Temperature", "Fresh and Raw", "5"),
    FruitVeg("Bitter Gourd", "Room Temperature", "Ripe but Still Good", "3"),
    FruitVeg("Bitter Gourd", "Room Temperature", "Slightly Overripe", "2"),
    FruitVeg("Bitter Gourd", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Bitter Gourd", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Bitter Gourd", "Freezer", "Slightly Overripe", "10"),
    FruitVeg("Bitter Gourd", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Bitter Gourd", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Bitter Gourd", "Refrigerator", "Slightly Overripe", "3"),

    // Add more fruits and vegetables here
    // Example for Mango
    FruitVeg("Mango", "Room Temperature", "Fresh and Raw", "7"),
    FruitVeg("Mango", "Room Temperature", "Ripe but Still Good", "5"),
    FruitVeg("Mango", "Room Temperature", "Slightly Overripe", "3"),
    FruitVeg("Mango", "Refrigerator", "Fresh and Raw", "14"),
    FruitVeg("Mango", "Refrigerator", "Ripe but Still Good", "7"),
    FruitVeg("Mango", "Refrigerator", "Slightly Overripe", "5"),
    FruitVeg("Mango", "Freezer", "Fresh and Raw", "Not Suitable for Freezing"),
    FruitVeg("Mango", "Freezer", "Ripe but Still Good", "Not Suitable for Freezing"),
    FruitVeg("Mango", "Freezer", "Slightly Overripe", "Not Suitable for Freezing"),

    FruitVeg("Apple", "Room Temperature", "Fresh and Raw", "7"),
    FruitVeg("Apple", "Room Temperature", "Ripe but Still Good", "5"),
    FruitVeg("Apple", "Room Temperature", "Slightly Overripe", "3"),
    FruitVeg("Apple", "Refrigerator", "Fresh and Raw", "30"),
    FruitVeg("Apple", "Refrigerator", "Ripe but Still Good", "20"),
    FruitVeg("Apple", "Refrigerator", "Slightly Overripe", "10"),
    FruitVeg("Apple", "Freezer", "Fresh and Raw", "60"),
    FruitVeg("Apple", "Freezer", "Ripe but Still Good", "45"),
    FruitVeg("Apple", "Freezer", "Slightly Overripe", "20"),

    // Onion
    FruitVeg("Onion", "Room Temperature", "Fresh and Raw", "30"),
    FruitVeg("Onion", "Room Temperature", "Ripe but Still Good", "20"),
    FruitVeg("Onion", "Room Temperature", "Slightly Overripe", "10"),
    FruitVeg("Onion", "Refrigerator", "Fresh and Raw", "60"),
    FruitVeg("Onion", "Refrigerator", "Ripe but Still Good", "45"),
    FruitVeg("Onion", "Refrigerator", "Slightly Overripe", "20"),
    FruitVeg("Onion", "Freezer", "Fresh and Raw", "90"),
    FruitVeg("Onion", "Freezer", "Ripe but Still Good", "60"),
    FruitVeg("Onion", "Freezer", "Slightly Overripe", "30"),

    // Banana
    FruitVeg("Banana", "Room Temperature", "Fresh and Raw", "7"),
    FruitVeg("Banana", "Room Temperature", "Ripe but Still Good", "5"),
    FruitVeg("Banana", "Room Temperature", "Slightly Overripe", "3"),
    FruitVeg("Banana", "Refrigerator", "Fresh and Raw", "10"),
    FruitVeg("Banana", "Refrigerator", "Ripe but Still Good", "7"),
    FruitVeg("Banana", "Refrigerator", "Slightly Overripe", "5"),
    FruitVeg("Banana", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Banana", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Banana", "Freezer", "Slightly Overripe", "10"),

    // Tomato
    FruitVeg("Tomato", "Room Temperature", "Fresh and Raw", "7"),
    FruitVeg("Tomato", "Room Temperature", "Ripe but Still Good", "5"),
    FruitVeg("Tomato", "Room Temperature", "Slightly Overripe", "3"),
    FruitVeg("Tomato", "Refrigerator", "Fresh and Raw", "10"),
    FruitVeg("Tomato", "Refrigerator", "Ripe but Still Good", "7"),
    FruitVeg("Tomato", "Refrigerator", "Slightly Overripe", "5"),
    FruitVeg("Tomato", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Tomato", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Tomato", "Freezer", "Slightly Overripe", "10"),


    FruitVeg("Parsley", "Room Temperature", "Fresh and Raw", "2"),
    FruitVeg("Parsley", "Room Temperature", "Ripe but Still Good", "1"),
    FruitVeg("Parsley", "Room Temperature", "Slightly Overripe", "1"),
    FruitVeg("Parsley", "Refrigerator", "Fresh and Raw", "14"),
    FruitVeg("Parsley", "Refrigerator", "Ripe but Still Good", "10"),
    FruitVeg("Parsley", "Refrigerator", "Slightly Overripe", "7"),
    FruitVeg("Parsley", "Freezer", "Fresh and Raw", "90"),
    FruitVeg("Parsley", "Freezer", "Ripe but Still Good", "60"),
    FruitVeg("Parsley", "Freezer", "Slightly Overripe", "30"),

    // Okra
    FruitVeg("Okra", "Room Temperature", "Fresh and Raw", "3"),
    FruitVeg("Okra", "Room Temperature", "Ripe but Still Good", "2"),
    FruitVeg("Okra", "Room Temperature", "Slightly Overripe", "1"),
    FruitVeg("Okra", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Okra", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Okra", "Refrigerator", "Slightly Overripe", "3"),
    FruitVeg("Okra", "Freezer", "Fresh and Raw", "60"),
    FruitVeg("Okra", "Freezer", "Ripe but Still Good", "45"),
    FruitVeg("Okra", "Freezer", "Slightly Overripe", "30"),

    // Cucumber
    FruitVeg("Cucumber", "Room Temperature", "Fresh and Raw", "5"),
    FruitVeg("Cucumber", "Room Temperature", "Ripe but Still Good", "3"),
    FruitVeg("Cucumber", "Room Temperature", "Slightly Overripe", "2"),
    FruitVeg("Cucumber", "Refrigerator", "Fresh and Raw", "10"),
    FruitVeg("Cucumber", "Refrigerator", "Ripe but Still Good", "7"),
    FruitVeg("Cucumber", "Refrigerator", "Slightly Overripe", "5"),
    FruitVeg("Cucumber", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Cucumber", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Cucumber", "Freezer", "Slightly Overripe", "10"),

    // Orange
    FruitVeg("Orange", "Room Temperature", "Fresh and Raw", "14"),
    FruitVeg("Orange", "Room Temperature", "Ripe but Still Good", "10"),
    FruitVeg("Orange", "Room Temperature", "Slightly Overripe", "7"),
    FruitVeg("Orange", "Refrigerator", "Fresh and Raw", "30"),
    FruitVeg("Orange", "Refrigerator", "Ripe but Still Good", "20"),
    FruitVeg("Orange", "Refrigerator", "Slightly Overripe", "10"),
    FruitVeg("Orange", "Freezer", "Fresh and Raw", "60"),
    FruitVeg("Orange", "Freezer", "Ripe but Still Good", "45"),
    FruitVeg("Orange", "Freezer", "Slightly Overripe", "30"),

    // Pear
    FruitVeg("Pear", "Room Temperature", "Fresh and Raw", "5"),
    FruitVeg("Pear", "Room Temperature", "Ripe but Still Good", "3"),
    FruitVeg("Pear", "Room Temperature", "Slightly Overripe", "2"),
    FruitVeg("Pear", "Refrigerator", "Fresh and Raw", "14"),
    FruitVeg("Pear", "Refrigerator", "Ripe but Still Good", "10"),
    FruitVeg("Pear", "Refrigerator", "Slightly Overripe", "7"),
    FruitVeg("Pear", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Pear", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Pear", "Freezer", "Slightly Overripe", "10"),

    // Banana
    FruitVeg("Banana", "Room Temperature", "Fresh and Raw", "7"),
    FruitVeg("Banana", "Room Temperature", "Ripe but Still Good", "5"),
    FruitVeg("Banana", "Room Temperature", "Slightly Overripe", "3"),
    FruitVeg("Banana", "Refrigerator", "Fresh and Raw", "10"),
    FruitVeg("Banana", "Refrigerator", "Ripe but Still Good", "7"),
    FruitVeg("Banana", "Refrigerator", "Slightly Overripe", "5"),
    FruitVeg("Banana", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Banana", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Banana", "Freezer", "Slightly Overripe", "10"),

    // Guava
    FruitVeg("Guava", "Room Temperature", "Fresh and Raw", "5"),
    FruitVeg("Guava", "Room Temperature", "Ripe but Still Good", "3"),
    FruitVeg("Guava", "Room Temperature", "Slightly Overripe", "2"),
    FruitVeg("Guava", "Refrigerator", "Fresh and Raw", "14"),
    FruitVeg("Guava", "Refrigerator", "Ripe but Still Good", "10"),
    FruitVeg("Guava", "Refrigerator", "Slightly Overripe", "7"),
    FruitVeg("Guava", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Guava", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Guava", "Freezer", "Slightly Overripe", "10"),

    // Dragonfruit
    FruitVeg("Dragonfruit", "Room Temperature", "Fresh and Raw", "5"),
    FruitVeg("Dragonfruit", "Room Temperature", "Ripe but Still Good", "3"),
    FruitVeg("Dragonfruit", "Room Temperature", "Slightly Overripe", "2"),
    FruitVeg("Dragonfruit", "Refrigerator", "Fresh and Raw", "14"),
    FruitVeg("Dragonfruit", "Refrigerator", "Ripe but Still Good", "10"),
    FruitVeg("Dragonfruit", "Refrigerator", "Slightly Overripe", "7"),
    FruitVeg("Dragonfruit", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Dragonfruit", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Dragonfruit", "Freezer", "Slightly Overripe", "10"),

        // Beetroot
    FruitVeg("Beetroot", "Room Temperature", "Fresh and Raw", "7"),
    FruitVeg("Beetroot", "Room Temperature", "Ripe but Still Good", "5"),
    FruitVeg("Beetroot", "Room Temperature", "Slightly Overripe", "3"),
    FruitVeg("Beetroot", "Refrigerator", "Fresh and Raw", "14"),
    FruitVeg("Beetroot", "Refrigerator", "Ripe but Still Good", "10"),
    FruitVeg("Beetroot", "Refrigerator", "Slightly Overripe", "7"),
    FruitVeg("Beetroot", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Beetroot", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Beetroot", "Freezer", "Slightly Overripe", "10"),

    // Spinach
    FruitVeg("Spinach", "Room Temperature", "Fresh and Raw", "2"),
    FruitVeg("Spinach", "Room Temperature", "Ripe but Still Good", "1"),
    FruitVeg("Spinach", "Room Temperature", "Slightly Overripe", "1"),
    FruitVeg("Spinach", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Spinach", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Spinach", "Refrigerator", "Slightly Overripe", "3"),
    FruitVeg("Spinach", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Spinach", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Spinach", "Freezer", "Slightly Overripe", "10"),

    // Coriander
    FruitVeg("Coriander", "Room Temperature", "Fresh and Raw", "2"),
    FruitVeg("Coriander", "Room Temperature", "Ripe but Still Good", "1"),
    FruitVeg("Coriander", "Room Temperature", "Slightly Overripe", "1"),
    FruitVeg("Coriander", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Coriander", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Coriander", "Refrigerator", "Slightly Overripe", "3"),
    FruitVeg("Coriander", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Coriander", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Coriander", "Freezer", "Slightly Overripe", "10"),

    // Lettuce
    FruitVeg("Lettuce", "Room Temperature", "Fresh and Raw", "3"),
    FruitVeg("Lettuce", "Room Temperature", "Ripe but Still Good", "2"),
    FruitVeg("Lettuce", "Room Temperature", "Slightly Overripe", "1"),
    FruitVeg("Lettuce", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Lettuce", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Lettuce", "Refrigerator", "Slightly Overripe", "3"),
    FruitVeg("Lettuce", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Lettuce", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Lettuce", "Freezer", "Slightly Overripe", "10"),

    // Sweet Potato
    FruitVeg("Sweet Potato", "Room Temperature", "Fresh and Raw", "10"),
    FruitVeg("Sweet Potato", "Room Temperature", "Ripe but Still Good", "7"),
    FruitVeg("Sweet Potato", "Room Temperature", "Slightly Overripe", "5"),
    FruitVeg("Sweet Potato", "Refrigerator", "Fresh and Raw", "20"),
    FruitVeg("Sweet Potato", "Refrigerator", "Ripe but Still Good", "14"),
    FruitVeg("Sweet Potato", "Refrigerator", "Slightly Overripe", "10"),
    FruitVeg("Sweet Potato", "Freezer", "Fresh and Raw", "60"),
    FruitVeg("Sweet Potato", "Freezer", "Ripe but Still Good", "45"),
    FruitVeg("Sweet Potato", "Freezer", "Slightly Overripe", "30"),

    // Beans
    FruitVeg("Beans", "Room Temperature", "Fresh and Raw", "5"),
    FruitVeg("Beans", "Room Temperature", "Ripe but Still Good", "3"),
    FruitVeg("Beans", "Room Temperature", "Slightly Overripe", "2"),
    FruitVeg("Beans", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Beans", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Beans", "Refrigerator", "Slightly Overripe", "3"),
    FruitVeg("Beans", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Beans", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Beans", "Freezer", "Slightly Overripe", "10"),

    // Custard Apple
    FruitVeg("Custard Apple", "Room Temperature", "Fresh and Raw", "3"),
    FruitVeg("Custard Apple", "Room Temperature", "Ripe but Still Good", "2"),
    FruitVeg("Custard Apple", "Room Temperature", "Slightly Overripe", "1"),
    FruitVeg("Custard Apple", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Custard Apple", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Custard Apple", "Refrigerator", "Slightly Overripe", "3"),
    FruitVeg("Custard Apple", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Custard Apple", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Custard Apple", "Freezer", "Slightly Overripe", "10"),

    // Ice Apple
    FruitVeg("Ice Apple", "Room Temperature", "Fresh and Raw", "2"),
    FruitVeg("Ice Apple", "Room Temperature", "Ripe but Still Good", "1"),
    FruitVeg("Ice Apple", "Room Temperature", "Slightly Overripe", "1"),
    FruitVeg("Ice Apple", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Ice Apple", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Ice Apple", "Refrigerator", "Slightly Overripe", "3"),
    FruitVeg("Ice Apple", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Ice Apple", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Ice Apple", "Freezer", "Slightly Overripe", "10"),

    // Broccoli
    FruitVeg("Broccoli", "Room Temperature", "Fresh and Raw", "3"),
    FruitVeg("Broccoli", "Room Temperature", "Ripe but Still Good", "2"),
    FruitVeg("Broccoli", "Room Temperature", "Slightly Overripe", "1"),
    FruitVeg("Broccoli", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Broccoli", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Broccoli", "Refrigerator", "Slightly Overripe", "3"),
    FruitVeg("Broccoli", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Broccoli", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Broccoli", "Freezer", "Slightly Overripe", "10"),

    // Ginger
    FruitVeg("Ginger", "Room Temperature", "Fresh and Raw", "7"),
    FruitVeg("Ginger", "Room Temperature", "Ripe but Still Good", "5"),
    FruitVeg("Ginger", "Room Temperature", "Slightly Overripe", "3"),
    FruitVeg("Ginger", "Refrigerator", "Fresh and Raw", "14"),
    FruitVeg("Ginger", "Refrigerator", "Ripe but Still Good", "10"),
    FruitVeg("Ginger", "Refrigerator", "Slightly Overripe", "7"),
    FruitVeg("Ginger", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Ginger", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Ginger", "Freezer", "Slightly Overripe", "10"),

    // Chilli
    FruitVeg("Chilli", "Room Temperature", "Fresh and Raw", "5"),
    FruitVeg("Chilli", "Room Temperature", "Ripe but Still Good", "3"),
    FruitVeg("Chilli", "Room Temperature", "Slightly Overripe", "2"),
    FruitVeg("Chilli", "Refrigerator", "Fresh and Raw", "10"),
    FruitVeg("Chilli", "Refrigerator", "Ripe but Still Good", "7"),
    FruitVeg("Chilli", "Refrigerator", "Slightly Overripe", "5"),
    FruitVeg("Chilli", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Chilli", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Chilli", "Freezer", "Slightly Overripe", "10"),

    // Garlic
    FruitVeg("Garlic", "Room Temperature", "Fresh and Raw", "14"),
    FruitVeg("Garlic", "Room Temperature", "Ripe but Still Good", "10"),
    FruitVeg("Garlic", "Room Temperature", "Slightly Overripe", "7"),
    FruitVeg("Garlic", "Refrigerator", "Fresh and Raw", "30"),
    FruitVeg("Garlic", "Refrigerator", "Ripe but Still Good", "20"),
    FruitVeg("Garlic", "Refrigerator", "Slightly Overripe", "10"),
    FruitVeg("Garlic", "Freezer", "Fresh and Raw", "60"),
    FruitVeg("Garlic", "Freezer", "Ripe but Still Good", "40"),
    FruitVeg("Garlic", "Freezer", "Slightly Overripe", "30"),

    // Bitter Gourd
    FruitVeg("Bitter Gourd", "Room Temperature", "Fresh and Raw", "5"),
    FruitVeg("Bitter Gourd", "Room Temperature", "Ripe but Still Good", "3"),
    FruitVeg("Bitter Gourd", "Room Temperature", "Slightly Overripe", "2"),
    FruitVeg("Bitter Gourd", "Refrigerator", "Fresh and Raw", "10"),
    FruitVeg("Bitter Gourd", "Refrigerator", "Ripe but Still Good", "7"),
    FruitVeg("Bitter Gourd", "Refrigerator", "Slightly Overripe", "5"),
    FruitVeg("Bitter Gourd", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Bitter Gourd", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Bitter Gourd", "Freezer", "Slightly Overripe", "10"),

    // Bottle Gourd
    FruitVeg("Bottle Gourd", "Room Temperature", "Fresh and Raw", "7"),
    FruitVeg("Bottle Gourd", "Room Temperature", "Ripe but Still Good", "5"),
    FruitVeg("Bottle Gourd", "Room Temperature", "Slightly Overripe", "3"),
    FruitVeg("Bottle Gourd", "Refrigerator", "Fresh and Raw", "14"),
    FruitVeg("Bottle Gourd", "Refrigerator", "Ripe but Still Good", "10"),
    FruitVeg("Bottle Gourd", "Refrigerator", "Slightly Overripe", "7"),
    FruitVeg("Bottle Gourd", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Bottle Gourd", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Bottle Gourd", "Freezer", "Slightly Overripe", "10"),

    // Snake Gourd
    FruitVeg("Snake Gourd", "Room Temperature", "Fresh and Raw", "5"),
    FruitVeg("Snake Gourd", "Room Temperature", "Ripe but Still Good", "3"),
    FruitVeg("Snake Gourd", "Room Temperature", "Slightly Overripe", "2"),
    FruitVeg("Snake Gourd", "Refrigerator", "Fresh and Raw", "10"),
    FruitVeg("Snake Gourd", "Refrigerator", "Ripe but Still Good", "7"),
    FruitVeg("Snake Gourd", "Refrigerator", "Slightly Overripe", "5"),
    FruitVeg("Snake Gourd", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Snake Gourd", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Snake Gourd", "Freezer", "Slightly Overripe", "10"),

        // Avocado
    FruitVeg("Avocado", "Room Temperature", "Fresh and Raw", "3"),
    FruitVeg("Avocado", "Room Temperature", "Ripe but Still Good", "2"),
    FruitVeg("Avocado", "Room Temperature", "Slightly Overripe", "1"),
    FruitVeg("Avocado", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Avocado", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Avocado", "Refrigerator", "Slightly Overripe", "3"),
    FruitVeg("Avocado", "Freezer", "Fresh and Raw", "20"),
    FruitVeg("Avocado", "Freezer", "Ripe but Still Good", "10"),
    FruitVeg("Avocado", "Freezer", "Slightly Overripe", "5"),

    // Capsicum
    FruitVeg("Capsicum", "Room Temperature", "Fresh and Raw", "5"),
    FruitVeg("Capsicum", "Room Temperature", "Ripe but Still Good", "3"),
    FruitVeg("Capsicum", "Room Temperature", "Slightly Overripe", "2"),
    FruitVeg("Capsicum", "Refrigerator", "Fresh and Raw", "10"),
    FruitVeg("Capsicum", "Refrigerator", "Ripe but Still Good", "7"),
    FruitVeg("Capsicum", "Refrigerator", "Slightly Overripe", "5"),
    FruitVeg("Capsicum", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Capsicum", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Capsicum", "Freezer", "Slightly Overripe", "10"),

    // Cabbage
    FruitVeg("Cabbage", "Room Temperature", "Fresh and Raw", "5"),
    FruitVeg("Cabbage", "Room Temperature", "Ripe but Still Good", "3"),
    FruitVeg("Cabbage", "Room Temperature", "Slightly Overripe", "2"),
    FruitVeg("Cabbage", "Refrigerator", "Fresh and Raw", "14"),
    FruitVeg("Cabbage", "Refrigerator", "Ripe but Still Good", "10"),
    FruitVeg("Cabbage", "Refrigerator", "Slightly Overripe", "7"),
    FruitVeg("Cabbage", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Cabbage", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Cabbage", "Freezer", "Slightly Overripe", "10"),

    // Curry Leaves
    FruitVeg("Curry Leaves", "Room Temperature", "Fresh and Raw", "3"),
    FruitVeg("Curry Leaves", "Room Temperature", "Ripe but Still Good", "1"),
    FruitVeg("Curry Leaves", "Room Temperature", "Slightly Overripe", "1"),
    FruitVeg("Curry Leaves", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Curry Leaves", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Curry Leaves", "Refrigerator", "Slightly Overripe", "3"),
    FruitVeg("Curry Leaves", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Curry Leaves", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Curry Leaves", "Freezer", "Slightly Overripe", "10"),

    // Brinjal
    FruitVeg("Brinjal", "Room Temperature", "Fresh and Raw", "3"),
    FruitVeg("Brinjal", "Room Temperature", "Ripe but Still Good", "2"),
    FruitVeg("Brinjal", "Room Temperature", "Slightly Overripe", "1"),
    FruitVeg("Brinjal", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Brinjal", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Brinjal", "Refrigerator", "Slightly Overripe", "3"),
    FruitVeg("Brinjal", "Freezer", "Fresh and Raw", "20"),
    FruitVeg("Brinjal", "Freezer", "Ripe but Still Good", "15"),
    FruitVeg("Brinjal", "Freezer", "Slightly Overripe", "10"),

    // Blueberry
    FruitVeg("Blueberry", "Room Temperature", "Fresh and Raw", "2"),
    FruitVeg("Blueberry", "Room Temperature", "Ripe but Still Good", "1"),
    FruitVeg("Blueberry", "Room Temperature", "Slightly Overripe", "1"),
    FruitVeg("Blueberry", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Blueberry", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Blueberry", "Refrigerator", "Slightly Overripe", "3"),
    FruitVeg("Blueberry", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Blueberry", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Blueberry", "Freezer", "Slightly Overripe", "10"),

    // Blackberry
    FruitVeg("Blackberry", "Room Temperature", "Fresh and Raw", "2"),
    FruitVeg("Blackberry", "Room Temperature", "Ripe but Still Good", "1"),
    FruitVeg("Blackberry", "Room Temperature", "Slightly Overripe", "1"),
    FruitVeg("Blackberry", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Blackberry", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Blackberry", "Refrigerator", "Slightly Overripe", "3"),
    FruitVeg("Blackberry", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Blackberry", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Blackberry", "Freezer", "Slightly Overripe", "10"),

    // Raspberry
    FruitVeg("Raspberry", "Room Temperature", "Fresh and Raw", "2"),
    FruitVeg("Raspberry", "Room Temperature", "Ripe but Still Good", "1"),
    FruitVeg("Raspberry", "Room Temperature", "Slightly Overripe", "1"),
    FruitVeg("Raspberry", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Raspberry", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Raspberry", "Refrigerator", "Slightly Overripe", "3"),
    FruitVeg("Raspberry", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Raspberry", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Raspberry", "Freezer", "Slightly Overripe", "10"),

    // Strawberry
    FruitVeg("Strawberry", "Room Temperature", "Fresh and Raw", "2"),
    FruitVeg("Strawberry", "Room Temperature", "Ripe but Still Good", "1"),
    FruitVeg("Strawberry", "Room Temperature", "Slightly Overripe", "1"),
    FruitVeg("Strawberry", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Strawberry", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Strawberry", "Refrigerator", "Slightly Overripe", "3"),
    FruitVeg("Strawberry", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Strawberry", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Strawberry", "Freezer", "Slightly Overripe", "10"),

    // Black Grapes
    FruitVeg("Black Grapes", "Room Temperature", "Fresh and Raw", "3"),
    FruitVeg("Black Grapes", "Room Temperature", "Ripe but Still Good", "2"),
    FruitVeg("Black Grapes", "Room Temperature", "Slightly Overripe", "1"),
    FruitVeg("Black Grapes", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Black Grapes", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Black Grapes", "Refrigerator", "Slightly Overripe", "3"),
    FruitVeg("Black Grapes", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Black Grapes", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Black Grapes", "Freezer", "Slightly Overripe", "10"),

    // Lemon
    FruitVeg("Lemon", "Room Temperature", "Fresh and Raw", "5"),
    FruitVeg("Lemon", "Room Temperature", "Ripe but Still Good", "3"),
    FruitVeg("Lemon", "Room Temperature", "Slightly Overripe", "2"),
    FruitVeg("Lemon", "Refrigerator", "Fresh and Raw", "14"),
    FruitVeg("Lemon", "Refrigerator", "Ripe but Still Good", "10"),
    FruitVeg("Lemon", "Refrigerator", "Slightly Overripe", "7"),
    FruitVeg("Lemon", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Lemon", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Lemon", "Freezer", "Slightly Overripe", "10"),

    // Pineapple
    FruitVeg("Pineapple", "Room Temperature", "Fresh and Raw", "3"),
    FruitVeg("Pineapple", "Room Temperature", "Ripe but Still Good", "2"),
    FruitVeg("Pineapple", "Room Temperature", "Slightly Overripe", "1"),
    FruitVeg("Pineapple", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Pineapple", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Pineapple", "Refrigerator", "Slightly Overripe", "3"),
    FruitVeg("Pineapple", "Freezer", "Fresh and Raw", "20"),
    FruitVeg("Pineapple", "Freezer", "Ripe but Still Good", "15"),
    FruitVeg("Pineapple", "Freezer", "Slightly Overripe", "10"),

    // Papaya
    FruitVeg("Papaya", "Room Temperature", "Fresh and Raw", "3"),
    FruitVeg("Papaya", "Room Temperature", "Ripe but Still Good", "2"),
    FruitVeg("Papaya", "Room Temperature", "Slightly Overripe", "1"),
    FruitVeg("Papaya", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Papaya", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Papaya", "Refrigerator", "Slightly Overripe", "3"),
    FruitVeg("Papaya", "Freezer", "Fresh and Raw", "20"),
    FruitVeg("Papaya", "Freezer", "Ripe but Still Good", "15"),
    FruitVeg("Papaya", "Freezer", "Slightly Overripe", "10"),

    // Cherries
    FruitVeg("Cherries", "Room Temperature", "Fresh and Raw", "2"),
    FruitVeg("Cherries", "Room Temperature", "Ripe but Still Good", "1"),
    FruitVeg("Cherries", "Room Temperature", "Slightly Overripe", "1"),
    FruitVeg("Cherries", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Cherries", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Cherries", "Refrigerator", "Slightly Overripe", "3"),
    FruitVeg("Cherries", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Cherries", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Cherries", "Freezer", "Slightly Overripe", "10"),

    // Watermelon
    FruitVeg("Watermelon", "Room Temperature", "Fresh and Raw", "2"),
    FruitVeg("Watermelon", "Room Temperature", "Ripe but Still Good", "1"),
    FruitVeg("Watermelon", "Room Temperature", "Slightly Overripe", "1"),
    FruitVeg("Watermelon", "Refrigerator", "Fresh and Raw", "7"),
    FruitVeg("Watermelon", "Refrigerator", "Ripe but Still Good", "5"),
    FruitVeg("Watermelon", "Refrigerator", "Slightly Overripe", "3"),
    FruitVeg("Watermelon", "Freezer", "Fresh and Raw", "30"),
    FruitVeg("Watermelon", "Freezer", "Ripe but Still Good", "20"),
    FruitVeg("Watermelon", "Freezer", "Slightly Overripe", "10"),

    // Jackfruit
FruitVeg("Jackfruit", "Room Temperature", "Fresh and Raw", "3"),
FruitVeg("Jackfruit", "Room Temperature", "Ripe but Still Good", "2"),
FruitVeg("Jackfruit", "Room Temperature", "Slightly Overripe", "1"),
FruitVeg("Jackfruit", "Refrigerator", "Fresh and Raw", "7"),
FruitVeg("Jackfruit", "Refrigerator", "Ripe but Still Good", "5"),
FruitVeg("Jackfruit", "Refrigerator", "Slightly Overripe", "3"),
FruitVeg("Jackfruit", "Freezer", "Fresh and Raw", "20"),
FruitVeg("Jackfruit", "Freezer", "Ripe but Still Good", "15"),
FruitVeg("Jackfruit", "Freezer", "Slightly Overripe", "10"),

// Kiwi
FruitVeg("Kiwi", "Room Temperature", "Fresh and Raw", "4"),
FruitVeg("Kiwi", "Room Temperature", "Ripe but Still Good", "3"),
FruitVeg("Kiwi", "Room Temperature", "Slightly Overripe", "2"),
FruitVeg("Kiwi", "Refrigerator", "Fresh and Raw", "14"),
FruitVeg("Kiwi", "Refrigerator", "Ripe but Still Good", "10"),
FruitVeg("Kiwi", "Refrigerator", "Slightly Overripe", "7"),
FruitVeg("Kiwi", "Freezer", "Fresh and Raw", "30"),
FruitVeg("Kiwi", "Freezer", "Ripe but Still Good", "20"),
FruitVeg("Kiwi", "Freezer", "Slightly Overripe", "15"),

// Water Apple
FruitVeg("Water Apple", "Room Temperature", "Fresh and Raw", "2"),
FruitVeg("Water Apple", "Room Temperature", "Ripe but Still Good", "1"),
FruitVeg("Water Apple", "Room Temperature", "Slightly Overripe", "1"),
FruitVeg("Water Apple", "Refrigerator", "Fresh and Raw", "5"),
FruitVeg("Water Apple", "Refrigerator", "Ripe but Still Good", "3"),
FruitVeg("Water Apple", "Refrigerator", "Slightly Overripe", "2"),
FruitVeg("Water Apple", "Freezer", "Fresh and Raw", "15"),
FruitVeg("Water Apple", "Freezer", "Ripe but Still Good", "10"),
FruitVeg("Water Apple", "Freezer", "Slightly Overripe", "7"),

// Starfruit
FruitVeg("Starfruit", "Room Temperature", "Fresh and Raw", "3"),
FruitVeg("Starfruit", "Room Temperature", "Ripe but Still Good", "2"),
FruitVeg("Starfruit", "Room Temperature", "Slightly Overripe", "1"),
FruitVeg("Starfruit", "Refrigerator", "Fresh and Raw", "7"),
FruitVeg("Starfruit", "Refrigerator", "Ripe but Still Good", "5"),
FruitVeg("Starfruit", "Refrigerator", "Slightly Overripe", "3"),
FruitVeg("Starfruit", "Freezer", "Fresh and Raw", "20"),
FruitVeg("Starfruit", "Freezer", "Ripe but Still Good", "15"),
FruitVeg("Starfruit", "Freezer", "Slightly Overripe", "10"),

// Fig
FruitVeg("Fig", "Room Temperature", "Fresh and Raw", "2"),
FruitVeg("Fig", "Room Temperature", "Ripe but Still Good", "1"),
FruitVeg("Fig", "Room Temperature", "Slightly Overripe", "1"),
FruitVeg("Fig", "Refrigerator", "Fresh and Raw", "5"),
FruitVeg("Fig", "Refrigerator", "Ripe but Still Good", "3"),
FruitVeg("Fig", "Refrigerator", "Slightly Overripe", "2"),
FruitVeg("Fig", "Freezer", "Fresh and Raw", "15"),
FruitVeg("Fig", "Freezer", "Ripe but Still Good", "10"),
FruitVeg("Fig", "Freezer", "Slightly Overripe", "7"),

// Pumpkin
FruitVeg("Pumpkin", "Room Temperature", "Fresh and Raw", "30"),
FruitVeg("Pumpkin", "Room Temperature", "Ripe but Still Good", "20"),
FruitVeg("Pumpkin", "Room Temperature", "Slightly Overripe", "10"),
FruitVeg("Pumpkin", "Refrigerator", "Fresh and Raw", "60"),
FruitVeg("Pumpkin", "Refrigerator", "Ripe but Still Good", "45"),
FruitVeg("Pumpkin", "Refrigerator", "Slightly Overripe", "30"),
FruitVeg("Pumpkin", "Freezer", "Fresh and Raw", "180"),
FruitVeg("Pumpkin", "Freezer", "Ripe but Still Good", "120"),
FruitVeg("Pumpkin", "Freezer", "Slightly Overripe", "90"),

FruitVeg("Carrot", "Room Temperature", "Fresh and Raw", "14"),
FruitVeg("Carrot", "Room Temperature", "Ripe but Still Good", "7"),
FruitVeg("Carrot", "Room Temperature", "Slightly Overripe", "3"),
FruitVeg("Carrot", "Refrigerator", "Fresh and Raw", "30"),
FruitVeg("Carrot", "Refrigerator", "Ripe but Still Good", "20"),
FruitVeg("Carrot", "Refrigerator", "Slightly Overripe", "10"),
FruitVeg("Carrot", "Freezer", "Fresh and Raw", "120"),
FruitVeg("Carrot", "Freezer", "Ripe but Still Good", "90"),
FruitVeg("Carrot", "Freezer", "Slightly Overripe", "45"),

FruitVeg("Potato", "Room Temperature", "Fresh and Raw", "30"),
FruitVeg("Potato", "Room Temperature", "Ripe but Still Good", "10"),
FruitVeg("Potato", "Room Temperature", "Slightly Overripe", "7"),
FruitVeg("Potato", "Refrigerator", "Fresh and Raw", "90"),
FruitVeg("Potato", "Refrigerator", "Ripe but Still Good", "60"),
FruitVeg("Potato", "Refrigerator", "Slightly Overripe", "30"),
FruitVeg("Potato", "Freezer", "Fresh and Raw", "180"),
FruitVeg("Potato", "Freezer", "Ripe but Still Good", "90"),
FruitVeg("Potato", "Freezer", "Slightly Overripe", "30"),




  ];
    
}
List<String> getUniqueFruitVegNames(List<FruitVeg> fruitVegList) {
  return fruitVegList.map((fv) => fv.name).toSet().toList()..sort();
}