//
//  OnboardingView.swift
//  Recipe Book
//
//  Created by Moladin on 13/11/2025.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var selectedViewIndex = 0
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        HStack{
            Spacer()
            Button("Skip"){
                dismiss()
            }
            .foregroundStyle(.terracotta)
            .bold()
            .padding(.trailing, 32)
        }
        ZStack{
            TabView(selection: $selectedViewIndex){
                OnboardingDetailView(headline: "Find Your Next Favorite Meal", caption:"Discover thousands of curated recipes and organize your cooking journey with ease.", img:"fork.knife", selectedTab: selectedViewIndex){
                    withAnimation {
                        selectedViewIndex = 1
                    }
                }.tag(0)
                OnboardingDetailView(headline: "Effortlessly Save Recipes", caption:"Save interesting recipes from anywhere with just one tap.", img:"bookmark", selectedTab: selectedViewIndex){
                    withAnimation {
                        selectedViewIndex = 2
                    }
                }.tag(1)
                OnboardingDetailView(headline: "You're All Set!", caption:"Your culinary adventure begins now. Find, create, and save recipes you'll love.", img:"carrot.fill", selectedTab: selectedViewIndex){
                    dismiss()
                }.tag(2)
            }.tabViewStyle(.page(indexDisplayMode: .never))
            
            VStack{
                Spacer()
                HStack(spacing: 16){
                    Spacer()
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 0 ? .terracotta : .lighterTerracotta)
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 1 ? .terracotta : .lighterTerracotta)
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 2 ? .terracotta : .lighterTerracotta)
                    Spacer()
                }
                .padding(.bottom, 200)
            }
        }
        .padding()
    }
}

#Preview {
    OnboardingView()
}
