//
//  RecipeCardView.swift
//  Recipe Book
//
//  Created by Moladin on 13/11/2025.
//

import SwiftUI
import SwiftData

struct RecipeCardView: View {
    var body: some View {
        VStack(alignment: .leading){
            Rectangle()
                .fill(Color.lighterTerracotta)
                .frame(height: 200)
                .overlay(
                    Image(systemName: "photo")
                        .font(.system(size: 50))
                        .foregroundColor(.gray.opacity(0.5))
                )
            
            VStack(alignment: .leading, spacing: 16){
                Text("Classic Spaghetti Carbonara")
                    .font(.sectionHeader)
                HStack(spacing: 12){
                    Text("Italian")
                        .font(.bodyText)
                        .foregroundColor(.red.opacity(0.8))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .fill(Color.red.opacity(0.1))
                        )
                    HStack(spacing: 4){
                        Image(systemName: "clock")
                            .font(.system(size: 14))
                        Text("30 min")
                            .font(.bodyText)
                    }
                    .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .padding(12)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 2)
    }
}

#Preview {
    RecipeCardView()
}
