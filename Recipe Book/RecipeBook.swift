//
//  Recipe_BookApp.swift
//  Recipe Book
//
//  Created by Moladin on 13/11/2025.
//

import SwiftUI
import SwiftData

@main
struct RecipeBook: App {
    
    @AppStorage("onboarding") var needsOnboarding = true
    var body: some Scene {
        WindowGroup {
            RecipeView()
                .modelContainer(for: [Recipe.self])
                .fullScreenCover(isPresented: $needsOnboarding) {
                    needsOnboarding = false
                } content: {
                    OnboardingView()
                }
        }
    }
}
