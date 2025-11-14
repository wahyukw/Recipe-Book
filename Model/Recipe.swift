//
//  Recipe.swift
//  Recipe Book
//
//  Created by Moladin on 13/11/2025.
//

import Foundation
import SwiftData

@Model
class Recipe:Identifiable{
    
    @Attribute(.unique) var id : String
    var name = ""
    var difficulty = ""
    var prepTime = 0
    var cookTime = 0
    var servings = 0
    var ingredients : [String] = []
    var instructions : [String] = []
    var dateAdded = Date()
    var imageData : Data?
    var rating: Int?
    
    var totalTime: Int{
        prepTime + cookTime
    }
    
    init(){
        id = UUID().uuidString
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
