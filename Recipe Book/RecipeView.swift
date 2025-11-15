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
                
                if recipes.count > 0{
                    ScrollView(showsIndicators: false){
                        LazyVStack(spacing: 32){
                            ForEach(recipes){r in
                                RecipeCardView(recipe: r)
                                    .onTapGesture {
                                        selectedRecipe = r
                                    }
                            }
                        }
                        .padding(.bottom, 24)
                    }
                }else{
                    Spacer()
                    VStack(spacing: 16){
                        HStack{
                            Spacer()
                            ZStack{
                                Circle()
                                    .frame(width: 125)
                                    .foregroundStyle(Color.paleTerracotta)
                                Image(systemName: "book.pages")
                                    .resizable()
                                    .frame(width: 40, height: 50)
                                    .foregroundStyle(Color.terracotta)
                            }
                            Spacer()
                        }
                        Text("No recipes Yet")
                            .font(.sectionHeader)
                        Text("Tap the + button to add your first recipe and start cooking!")
                            .font(.bodyText)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    Spacer()
                }
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        AddEditView(isEdit: false, recipe: nil)
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.terracotta)
                    }
                }
            }
            .navigationDestination(item: $selectedRecipe) { r in
                RecipeDetailView(recipe: r)
            }
            .background(Color.offWhite)
        }
    }
}

#Preview {
    RecipeView()
}
