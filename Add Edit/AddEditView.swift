//
//  AddEditView.swift
//  Recipe Book
//
//  Created by Moladin on 14/11/2025.
//

import SwiftUI
import PhotosUI
import SwiftData

struct AddEditView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var model
    var isEdit:Bool
    let recipe:Recipe?
    
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var selectedImageData: Data?
    @State private var recipeName = ""
    @State private var cuisine = ""
    @State private var difficulty: DifficultyLevel = .easy
    @State private var prepTime = 30
    @State private var cookTime = 45
    @State private var servings = 4
    @State private var ingredients: [String] = [""]
    @State private var instructions: [String] = [""]
    
    private var isFormValid: Bool {
            !recipeName.trimmingCharacters(in: .whitespaces).isEmpty &&
            !cuisine.trimmingCharacters(in: .whitespaces).isEmpty &&
            prepTime > 0 &&
            cookTime > 0 &&
            servings > 0 &&
            ingredients.contains(where: { !$0.trimmingCharacters(in: .whitespaces).isEmpty }) &&
            instructions.contains(where: { !$0.trimmingCharacters(in: .whitespaces).isEmpty })
        }
    
    var body: some View {
        VStack{
            HStack{
                Button("Cancel"){
                    dismiss()
                }
                .foregroundStyle(.terracotta)
                Spacer()
                Text(isEdit ? "Update Recipe" : "New Recipe")
                    .font(.sectionHeader)
                Spacer()
                Button("Save"){
                    saveRecipe()
                }
                .foregroundStyle(.terracotta)
                .bold()
                .disabled(!isFormValid)
            }
            Divider()
                .padding(.bottom, 24)
            Spacer()
            
            ScrollView(showsIndicators: false){
                VStack(spacing: 24){
                    //Photo picker
                    PhotosPicker(selection: $selectedPhoto, matching: .images) {
                        VStack(spacing: 16) {
                            if let selectedImageData,
                               let uiImage = UIImage(data: selectedImageData) {
                                // Show selected image
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 200)
                                    .clipped()
                                    .cornerRadius(12)
                            } else {
                                // Empty state - Add Photo
                                VStack(spacing: 12) {
                                    Image(systemName: "camera.fill")
                                        .font(.system(size: 40))
                                        .foregroundColor(.gray)
                                    
                                    Text("Add Photo")
                                        .font(.headline)
                                        .bold()
                                        .foregroundColor(.secondary)
                                    
                                    Text("Upload a picture of your recipe")
                                        .font(.bodyText)
                                        .foregroundColor(.secondary)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 200)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [8]))
                                        .foregroundColor(.secondary.opacity(0.5))
                                )
                            }
                        }
                    }
                    .onChange(of: selectedPhoto) { oldValue, newValue in
                        Task {
                            if let data = try? await newValue?.loadTransferable(type: Data.self) {
                                selectedImageData = data
                            }
                        }
                    }
                    //Recipe + Cuisine
                    VStack{
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Recipe Name")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            TextField("e.g., Classic Lasagna", text: $recipeName)
                                .padding(8)
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(.systemGray4), lineWidth: 0.5)
                                )
                        }
                        .padding(.bottom, 8)
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Cuisine")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            TextField("e.g., Italian", text: $cuisine)
                                .padding(8)
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(.systemGray4), lineWidth: 0.5)
                                )
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
                    
                    //Difficulty + prep time
                    VStack{
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Difficulty")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Menu {
                                Picker("Difficulty", selection: $difficulty) {
                                    ForEach(DifficultyLevel.allCases, id: \.self) { level in
                                        Text(level.rawValue).tag(level)
                                    }
                                }
                            } label: {
                                HStack {
                                    Text(difficulty.rawValue)
                                        .foregroundColor(.secondary.opacity(0.5))
                                        .font(.bodyText)
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.secondary)
                                }
                                .padding(8)
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(.systemGray4), lineWidth: 0.5)
                                )
                            }
                        }
                        .padding(.bottom, 8)
                        HStack(spacing: 12){
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Prep Time")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                HStack(spacing: 4) {
                                    TextField(String(prepTime), value: $prepTime, format: .number)
                                        .keyboardType(.numberPad)
                                        .multilineTextAlignment(.leading)
                                        .frame(maxWidth: .infinity)
                                    Text("min")
                                }
                                .foregroundColor(.secondary.opacity(0.5))
                                .padding(8)
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(.systemGray4), lineWidth: 0.5)
                                )
                            }
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Cook Time")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                HStack(spacing: 4) {
                                    TextField(String(cookTime), value: $cookTime, format: .number)
                                        .keyboardType(.numberPad)
                                        .multilineTextAlignment(.leading)
                                        .frame(maxWidth: .infinity)
                                    Text("min")
                                }
                                .foregroundColor(.secondary.opacity(0.5))
                                .padding(8)
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(.systemGray4), lineWidth: 0.5)
                                )
                            }
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Servings")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                TextField("4", value: $servings, format: .number)
                                    .foregroundColor(.secondary.opacity(0.5))
                                    .padding(8)
                                    .background(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color(.systemGray4), lineWidth: 0.5)
                                    )
                                    .keyboardType(.numberPad)
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
                    
                    //Ingredients
                    VStack{
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Ingredients")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            ForEach(ingredients.indices, id:\.self){ index in
                                HStack(spacing: 12){
                                    TextField("e.g., 2 cups flour", text: $ingredients[index])
                                        .foregroundColor(.secondary.opacity(0.5))
                                        .padding(8)
                                        .background(Color.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color(.systemGray4), lineWidth: 0.5)
                                        )
                                    if ingredients.count > 1 {
                                        Button{
                                            ingredients.remove(at: index)
                                        }label:{
                                            Image(systemName: "minus.circle.fill")
                                                .font(.title2)
                                                .foregroundColor(.terracotta)
                                        }
                                    }
                                }
                            }
                            .padding(.bottom, 8)
                            Button{
                                ingredients.append("")
                            }label:{
                                HStack(spacing: 8){
                                    Image(systemName: "plus.circle")
                                    Text("Add Ingredient")
                                }
                                .font(.subheadline)
                                .foregroundStyle(.terracotta)
                            }
                        }
                        .padding(.bottom, 8)
                        
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
                    
                    //Instructions
                    VStack{
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Instructions")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            ForEach(instructions.indices, id:\.self){ index in
                                HStack(alignment: .top, spacing: 12){
                                    Text("\(index+1).")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .frame(width: 20, alignment: .leading)
                                        .padding(.top, 12)
                                    
                                    TextField("Describe this step...", text: $instructions[index], axis: .vertical)
                                        .lineLimit(3...6)
                                        .foregroundColor(.secondary.opacity(0.5))
                                        .padding(8)
                                        .background(Color.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color(.systemGray4), lineWidth: 0.5)
                                        )
                                    if instructions.count > 1 {
                                        Button{
                                            instructions.remove(at: index)
                                        }label:{
                                            Image(systemName: "minus.circle.fill")
                                                .font(.title2)
                                                .foregroundColor(.terracotta)
                                        }
                                    }
                                }
                            }
                            .padding(.bottom, 8)
                            Button{
                                instructions.append("")
                            }label:{
                                HStack(spacing: 8){
                                    Image(systemName: "plus.circle")
                                    Text("Add Steps")
                                }
                                .font(.subheadline)
                                .foregroundStyle(.terracotta)
                            }
                        }
                        .padding(.bottom, 8)
                        
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
                }
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .onAppear {
            
            if isEdit, let recipe = recipe {
                recipeName = recipe.name
                cuisine = recipe.cuisine
                difficulty = recipe.difficulty
                prepTime = recipe.prepTime
                cookTime = recipe.cookTime
                servings = recipe.servings
                ingredients = recipe.ingredients.isEmpty ? [""] : recipe.ingredients
                instructions = recipe.instructions.isEmpty ? [""] : recipe.instructions
                selectedImageData = recipe.imageData
            }
        }
        .background(Color.offWhite)
    }
    
    func saveRecipe() {
        if isEdit, let existingRecipe = recipe {
            // ✅ Update existing recipe
            existingRecipe.name = recipeName
            existingRecipe.cuisine = cuisine
            existingRecipe.difficulty = difficulty
            existingRecipe.prepTime = prepTime
            existingRecipe.cookTime = cookTime
            existingRecipe.servings = servings
            existingRecipe.ingredients = ingredients.filter { !$0.isEmpty }
            existingRecipe.instructions = instructions.filter { !$0.isEmpty }
            existingRecipe.imageData = selectedImageData
        } else {
            // ✅ Create new recipe
            let newRecipe = Recipe(
                name: recipeName,
                cuisine: cuisine,
                difficulty: difficulty,
                prepTime: prepTime,
                cookTime: cookTime,
                servings: servings,
                ingredients: ingredients.filter { !$0.isEmpty },
                instructions: instructions.filter { !$0.isEmpty },
                imageData: selectedImageData
            )
            model.insert(newRecipe)
        }
        do {
            try model.save()
            dismiss()
        } catch {
            print("Failed to save: \(error)")
        }
    }
}

#Preview {
    AddEditView(isEdit: false, recipe: .sample)
}
