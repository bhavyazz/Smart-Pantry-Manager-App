 #  🧠 SmartPantry Manager
---

### An efficient way of Pantry Management!

---

## An intelligent Android app to track pantry items, reduce food waste, and provide recipe suggestions based on available items.

Built with a focus on sustainability and efficiency, SmartPantry Manager offers real-time inventory tracking, AI-powered expiry prediction, shopping list organization, and voice-enabled grocery input along with manual entries and a family collaboration feature.

---

## 📌 Abstract

Food waste is a growing global issue, often due to forgotten expiry dates, duplicate grocery purchases, and poor pantry visibility.

SmartPantry Manager solves this by providing:

- 📦 Smart inventory tracking  
- ⏰ Expiry prediction using AI  
- 🔔 Real-time alerts  
- 📱 Voice input via Google Voice API  
- 🛒 Shopping list management  
- 🍲 Recipe suggestions with cooking instructions  
- 👨‍👩‍👧 Collaborative pantry access through family management

By analyzing storage conditions (room temperature, fridge, freezer) and produce stages (raw, ripe, overripe), it estimates shelf life accurately, helping users prioritize usage and avoid spoilage.

---

## 🔧 Tech Stack

| Layer              | Technology Used                                       |
|--------------------|--------------------------------------------------------|
| Mobile App         | Flutter (Dart) via Android Studio                     |
| Backend & Sync     | Firebase Realtime Database + Firebase Auth            |
| Voice Input        | Google Speech-to-Text API                             |
| Recipe Engine      | Spoonacular API for recipe suggestions & instructions |
| Expiry Estimation  | AI rules based on produce ripeness + storage conditions |

---

## 🚀 Key Features

### 🧠 AI-Powered Expiry Prediction
- Estimates shelf life for items without printed expiry dates (e.g., fruits & vegetables).
- Analyzes:
  - Stage: Raw, Ripe, Overripe  
  - Storage: Room temperature, Refrigerated, Freezer


### 🔍 Real-Time Inventory Management
- Add, update, or remove pantry items.
- Track quantities and expiry dates visually.

### 🗣️ Voice-Based Item Management
- Add or update items hands-free using Google Voice API.
- Improves accessibility for users of all ages.


### 🍲 Smart Recipe Suggestions (Spoonacular API)
- Recommends recipes based on what's currently in your pantry.
- Prioritizes expiring items to reduce waste.
- Shows:
  - Recipe name  
  - Time required  
  - Step-by-step instructions  
  - Short summary on how to make  

### 🛒 Shopping List Management
- Create and manage shopping lists.
- You can delete, add, or scratch items.

### 👨‍👩‍👧‍👦 Collaborative Pantry
- Share pantry access with family or roommates.
- Enables better household coordination on groceries.

---

## 🧪 Results

- ✔️ Reduction in forgotten/expired items  
- ✔️ Smarter grocery planning and savings  
- ✔️ Enhanced collaboration for multi-member households  
- ✔️ Measurable impact on minimizing kitchen waste  

---

## 🧑‍💻 Team Members

- P Naga Bhavya Sree (1RV23IS083)  
- Rajata M Hegde (1RV23IS098)  
- Sahana (1RV24IS407)  
- N Srinidhi Krouncha (1RV23IS078)  

---

Got suggestions or questions?  
Feel free to open an issue or contact the contributors via GitHub.



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)  
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the  
[online documentation](https://docs.flutter.dev/), which offers tutorials,  
samples, guidance on mobile development, and a full API reference.
