//
//  OnboardingCardView.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import SwiftUI

struct OnboardingCardView: View {
    let item: OnboardingItem

    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                LottieView(name: item.animationFileName)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                    .padding(.horizontal, 8)
                    .frame(maxWidth: 400, maxHeight: 400)

                Text(item.title)
                    .foregroundStyle(.primary)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.horizontal, 16)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)

                Text(item.description)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)

                if item.shouldShowStartButton {
                    Button(action: {
                        item.startButtonCallback?()
                    }) {
                        HStack(spacing: 8) {
                            Text("START")

                            Image(systemName: "arrow.right.circle")
                                .imageScale(.large)
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 10)
                        .background(
                            Capsule().strokeBorder(Color.black, lineWidth: 1.25)
                        )
                        .padding([.top], 12)
                    }
                    .accentColor(Color.black)
                }

                Spacer()
            }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
    }
}

#Preview {
    OnboardingCardView(item: .init(
        animationFileName: "onboarding1",
        title: "Test",
        description: "Test description", 
        shouldShowStartButton: true
    ))
}
