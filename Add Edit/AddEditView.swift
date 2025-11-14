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
    
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var selectedImageData: Data?
    @State private var recipeName = ""
    @State private var cuisine = ""
    @State private var difficulty: DifficultyLevel = .easy
    @State private var prepTime = 30
    @State private var cookTime = 45
    @State private var servings = 4
    
    var body: some View {
        VStack{
            HStack{
                Button("Cancel"){
                    dismiss()
                }
                .foregroundStyle(.terracotta)
                Spacer()
                Text("New Recipe")
                    .font(.sectionHeader)
                Spacer()
                Button("Save"){
                    
                }
                .foregroundStyle(.terracotta)
                .bold()
            }
            Divider()
                .padding(.bottom, 24)
            Spacer()
            
            ScrollView{
                VStack(spacing: 16){
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
                    .shadow(color: Color.terracotta.opacity(0.1), radius: 8, x: 0, y: 2)
                }
            }
            
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AddEditView()
}
