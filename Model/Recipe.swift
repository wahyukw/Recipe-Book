//
//  Recipe.swift
//  Recipe Book
//
//  Created by Moladin on 13/11/2025.
//

import Foundation
import SwiftData

@Model
final class Recipe {
    @Attribute(.unique) var id: String
    var name: String
    var cuisine: String
    var difficulty: DifficultyLevel
    var prepTime: Int
    var cookTime: Int
    var servings: Int
    var ingredients: [String]
    var instructions: [String]
    var dateAdded: Date
    var imageData: Data?
    
    var totalTime: Int {
        prepTime + cookTime
    }
    
    init(
        name: String,
        cuisine: String,
        difficulty: DifficultyLevel,
        prepTime: Int,
        cookTime: Int,
        servings: Int,
        ingredients: [String] = [],
        instructions: [String] = [],
        imageData: Data? = nil
    ) {
        self.id = UUID().uuidString
        self.name = name
        self.cuisine = cuisine
        self.difficulty = difficulty
        self.prepTime = prepTime
        self.cookTime = cookTime
        self.servings = servings
        self.ingredients = ingredients
        self.instructions = instructions
        self.dateAdded = Date()
        self.imageData = imageData
    }
}

enum DifficultyLevel: String, Codable, CaseIterable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    
    var emoji: String {
        switch self {
        case .easy: return "😊"
        case .medium: return "🤔"
        case .hard: return "🔥"
        }
    }
}
