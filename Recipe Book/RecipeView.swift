//
//  ContentView.swift
//  Recipe Book
//
//  Created by Moladin on 13/11/2025.
//

import SwiftUI
import SwiftData

struct RecipeView: View {
    
    @Query private var recipes: [Recipe]
    @State var selectedRecipe : Recipe?
    @State private var search = ""
    
    var body: some View {
        
        NavigationStack{
            VStack (alignment: .leading){
                Text("Recipes")
                    .font(.screenHeading)
                TextField("Search recipes", text: $search)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 32)
                
                ScrollView(showsIndicators: false){
                    LazyVStack(spacing: 32){
                        RecipeCardView()
                        RecipeCardView()
                        RecipeCardView()
                    }
                    .padding(.bottom, 24)
                }
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        OnboardingView()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.terracotta)
                    }
                }
            }
        }
    }
}

#Preview {
    RecipeView()
}
