//
//  Recipe+Preview.swift
//  Recipe Book
//
//  Created by Assistant on 15/11/2025.
//

import Foundation

extension Recipe {
    static let sample: Recipe = Recipe(
        name: "Classic Lasagna Carbonara",
        cuisine: "Italian",
        difficulty: .medium,
        prepTime: 30,
        cookTime: 60,
        servings: 6,
        ingredients: [
            "12 lasagna noodles",
            "500g ground beef",
            "2 cups marinara sauce",
            "2 cups ricotta cheese",
            "2 cups shredded mozzarella",
            "1/2 cup grated Parmesan",
            "Salt & pepper"
        ],
        instructions: [
            "Preheat oven to 375°F (190°C).",
            "Cook noodles according to package instructions.",
            "Brown beef, season, and stir in marinara sauce.",
            "Layer noodles, ricotta, meat sauce, and cheeses.",
            "Repeat layers and finish with mozzarella on top.",
            "Bake 25–30 minutes until bubbly and golden."
        ],
        imageData: nil
    )

    static let samples: [Recipe] = [
        .sample,
        Recipe(
            name: "Chicken Tikka Masala",
            cuisine: "Indian",
            difficulty: .hard,
            prepTime: 40,
            cookTime: 50,
            servings: 4,
            ingredients: [
                "500g chicken",
                "1 cup yogurt",
                "Masala spice mix",
                "1 onion",
                "1 cup tomato puree",
                "Cream"
            ],
            instructions: [
                "Marinate chicken in yogurt and spices.",
                "Sear chicken; set aside.",
                "Cook onions and spices; add tomato puree.",
                "Simmer with cream; add chicken back.",
                "Serve with rice and naan."
            ],
            imageData: nil
        ),
        Recipe(
            name: "Avocado Toast",
            cuisine: "American",
            difficulty: .easy,
            prepTime: 5,
            cookTime: 5,
            servings: 1,
            ingredients: [
                "2 slices sourdough",
                "1 ripe avocado",
                "Salt, pepper, chili flakes",
                "Lemon juice"
            ],
            instructions: [
                "Toast bread.",
                "Mash avocado with lemon, salt, and pepper.",
                "Spread on toast and top with chili flakes."
            ],
            imageData: nil
        )
    ]
}
