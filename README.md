# Recipe Book 🍳

## About

A beautifully designed iOS recipe management app built with SwiftUI and SwiftData. Organize your favorite recipes, track cooking times, and never lose a great meal idea again.

## ✨ Features

- **Create & Edit Recipes** - Add your own recipes with detailed information
- **Photo Support** - Attach images to your recipes using the built-in photo picker
- **Smart Search** - Find recipes by name, cuisine, or ingredients
- **Recipe Details** - Track prep time, cook time, servings, difficulty level, and more
- **Organized View** - Browse all your recipes in a clean, card-based interface
- **Local Storage** - All data stored securely on your device using SwiftData
- **Onboarding Experience** - Smooth first-time user experience

---

## 📝 What I Learned

Building Recipe Book helped me learn several essential iOS development concepts:

- **SwiftData**: Implementing Apple's modern persistence framework for local data storage and CRUD operations
- **PhotosUI Integration**: Working with the native photo picker to handle image selection and data conversion
- **Form** Validation**: Building dynamic form validation with real-time feedback and conditional button states
- **Search & Filtering**: Implementing efficient search algorithms across multiple data fields with case-insensitive matching
- **Navigation Patterns**: Using NavigationStack with programmatic navigation and modal presentations
- **Custom Styling System**: Creating reusable font extensions and a cohesive color palette for consistent design
- **Data Modeling**: Designing SwiftData models with computed properties and custom enumerations
- **User Onboarding**: Building multi-page onboarding flows with AppStorage for first-launch detection
- **List Management**: Handling dynamic arrays for ingredients and instructions with add/remove functionality
- **Confirmation Dialogs**: Implementing safe delete operations with user confirmation to prevent accidental data loss

---

## 🛠️ Technologies

- **SwiftUI** - Modern declarative UI framework
- **SwiftData** - Apple's persistence framework for data storage
- **PhotosUI** - Native photo picker integration

---

## 📋 Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

---

## 🚀 Getting Started

1. Clone the repository:
```bash
git clone https://github.com/yourusername/recipe-book.git
```

2. Open the project in Xcode:
```bash
cd recipe-book
open Recipe\ Book.xcodeproj
```

3. Build and run the project on your simulator or device

## 📂 Project Structure

```
Recipe Book/
├── Models/
│   ├── Recipe.swift              # Core recipe data model
│   └── Recipe+Preview.swift      # Sample data for previews
├── Views/
│   ├── RecipeView.swift          # Main recipe list view
│   ├── RecipeCardView.swift      # Recipe card component
│   ├── RecipeDetailView.swift    # Detailed recipe view
│   ├── AddEditView.swift         # Add/Edit recipe form
│   ├── OnboardingView.swift      # Onboarding screen
│   └── OnboardingDetailView.swift
├── Helpers/
│   ├── FontHelper.swift          # Custom font styles
│   └── TimeHelper.swift          # Time formatting utilities
└── RecipeBook.swift              # App entry point
```

## 🎨 Design Features

- **Custom Color Palette** - Warm terracotta theme with complementary colors
- **Consistent Typography** - Custom font hierarchy for better readability

---

## 📝 Key Functionality

### Recipe Model
Each recipe includes:
- Name and cuisine type
- Difficulty level (Easy, Medium, Hard)
- Preparation and cooking time
- Number of servings
- Ingredients list
- Step-by-step instructions
- Optional photo

### Search & Filter
- Real-time search across recipe names, cuisines, and ingredients
- Case-insensitive matching
- Instant results as you type

### CRUD Operations
- **Create** - Add new recipes with full details
- **Read** - View all recipes and individual recipe details
- **Update** - Edit existing recipes
- **Delete** - Remove recipes with confirmation dialog

---

## 📱 Screenshots

<p float="left">
  <img src="Screenshots/onboarding.png" alt="Onboarding View" height="700" />
  <img src="Screenshots/empty-state.png" alt="Empty State" height="700" />
  <img src="Screenshots/add-edit-form.png" alt="Error State" height="700" />
  <img src="Screenshots/home-view.png" alt="Home View" height="700" />
  <img src="Screenshots/recipe-detail.png" alt="Home View" height="700" />
</p>

---

## 🤝 Contributing

This is a personal learning project, but feedback and suggestions are welcome! Feel free to:

- Open an issue for bugs or feature requests
- Submit pull requests for improvements
- Share your thoughts on the code architecture

---

## 📄 License

This project is created for educational purposes.

---

## 👤 Author

**Wahyu Kwan**
- GitHub: [@wahyukw](https://github.com/wahyukw)
- LinkedIn: [wahyukwan](https://www.linkedin.com/in/wahyukwan/)
- Email: wahyukwan@gmail.com

---

## 🙏 Acknowledgments

- Icons from SF Symbols
- Built with SwiftUI and SwiftData
- Inspired by a love of cooking and organization

---

<div align="center">

**Made with SwiftUI**

⭐ Star this repo if you find it helpful!

</div>
