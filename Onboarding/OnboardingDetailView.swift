//
//  OnboardingDetailView.swift
//  Recipe Book
//
//  Created by Moladin on 13/11/2025.
//

import SwiftUI

struct OnboardingDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let headline: String
    let caption: String
    let img: String
    let selectedTab: Int
    let buttonAction: () -> Void
    
    var body: some View {
        VStack{
            ZStack{
                    Circle()
                        .frame(width: 200)
                        .foregroundStyle(Color.lighterTerracotta)
                    Image(systemName: img)
                        .resizable()
                        .frame(width: 40, height: 50)
                        .foregroundStyle(Color.terracotta)
                }
                .padding(.bottom, 16)
                
                Text(headline)
                    .font(Font.headingText)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 12)
                Text(caption)
                    .font(Font.bodyText)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button {
                    buttonAction()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 300, height: 52)
                            .foregroundStyle(.terracotta)
                        Text(selectedTab == 2 ? "Get Started" : "Next")
                            .bold()
                            .foregroundStyle(.white)
                    }
                }
                .padding(.bottom, 95)
        }
        .padding(.top, 32)
    }
}

#Preview {
    OnboardingDetailView(headline: "Find Your Next Favorite Meal", caption: "Discover thousands of curated recipes and organize your cooking journey with ease.", img: "fork.knife", selectedTab: 2){
        
    }
}
