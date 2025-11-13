//
//  Recipe_BookApp.swift
//  Recipe Book
//
//  Created by Moladin on 13/11/2025.
//

import SwiftUI

@main
struct Recipe_BookApp: App {
    
    @AppStorage("onboarding") var needsOnboarding = true
    var body: some Scene {
        WindowGroup {
            ContentView()
                .fullScreenCover(isPresented: $needsOnboarding) {
                    needsOnboarding = false
                } content: {
                    OnboardingView()
                }
        }
    }
}
