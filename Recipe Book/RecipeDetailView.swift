//
//  RecipeDetailView.swift
//  Recipe Book
//
//  Created by Moladin on 15/11/2025.
//

import SwiftUI

struct RecipeDetailView: View {
    
    let recipe: Recipe
    var body: some View {
        VStack{
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16){
                    if let imageData = recipe.imageData,
                       let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    } else {
                        Rectangle()
                            .fill(Color.lighterTerracotta)
                            .frame(height: 200)
                            .overlay(
                                Image(systemName: "photo")
                                    .font(.system(size: 50))
                                    .foregroundColor(.gray.opacity(0.5))
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    }
                    Text(recipe.name)
                        .font(.screenHeading)
                    HStack(spacing: 12){
                        Text(recipe.cuisine)
                            .font(.bodyText)
                            .foregroundColor(.terracotta.opacity(0.8))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(
                                Capsule()
                                    .fill(Color.red.opacity(0.1))
                            )
                        Text("\(recipe.difficulty.rawValue) \(recipe.difficulty.emoji)")
                            .font(.bodyText)
                            .foregroundColor(.terracotta.opacity(0.8))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(
                                Capsule()
                                    .fill(Color.red.opacity(0.1))
                            )
                        HStack(spacing: 4){
                            Image(systemName: "clock")
                                .font(.system(size: 14))
                            Text(TimeHelper.hoursText(totalMinutes: recipe.totalTime))
                                .font(.bodyText)
                        }
                        .foregroundColor(.secondary)
                        HStack(spacing: 4){
                            Image(systemName: "person.2")
                                .font(.system(size: 14))
                            Text(String(recipe.servings))
                                .font(.bodyText)
                        }
                        .foregroundStyle(.secondary)
                    }
                    
                    Divider()
                    
                    Text("Ingredients")
                        .font(.sectionHeader)
                    ForEach(recipe.ingredients, id: \.self){ingredient in
                        HStack(spacing: 16){
                            Image(systemName: "circle.fill")
                                .font(.system(size: 8))
                            Text(ingredient)
                        }
                    }
                    
                    Divider()
                    
                    Text("Instructions")
                        .font(.sectionHeader)
                    ForEach(recipe.instructions, id: \.self){instruction in
                        HStack(spacing: 16){
                            Image(systemName: "circle.fill")
                                .font(.system(size: 8))
                            Text(instruction)
                        }
                    }
                }
            }
            Button(action: {
                
            }, label: {
                HStack(spacing: 12){
                    Image(systemName: "applepencil")
                        .font(.system(size: 20))
                    Text("Edit Recipe")
                        .bold()
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.terracotta)
                .cornerRadius(12)
            })
            .padding(.top, 16)
        }
        .background(Color.offWhite)
        .padding()
    }
}

#Preview {
    RecipeDetailView(recipe: .sample)
}
