//
//  OnboardingView.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import SwiftUI

struct OnboardingView: View {
    let viewModel: OnboardingViewModel

    var body: some View {
        ZStack {
            TabView {
                ForEach(viewModel.items, id: \.self) { item in
                    OnboardingCardView(item: item)
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color("OnboardingGradientStart"),
                    Color("OnboardingGradientStop")
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .onAppear {
            setupAppearance()
        }
    }

    private func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
}

#Preview {
    OnboardingView(viewModel: .init())
}
