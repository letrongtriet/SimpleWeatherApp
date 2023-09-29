//
//  OnboardingViewModel.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import SwiftUI

class OnboardingViewModel {
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted: Bool?

    lazy var items: [OnboardingItem] = [
        .init(
            animationFileName: "onboarding1",
            title: "Welcome",
            description: "Yet another Weather app",
            shouldShowStartButton: false
        ),
        .init(
            animationFileName: "onboarding2",
            title: "All your favorite in one place",
            description: "Managing all of your favorite cities and their weather in one place.",
            shouldShowStartButton: false
        ),
        .init(
            animationFileName: "onboarding3",
            title: "What are you waiting for?",
            description: "Tap the Start button below to kick start your best experience yet!",
            shouldShowStartButton: true,
            startButtonCallback: { [weak self] in
                self?.handleStartButtonCallback()
            }
        ),
    ]

    private func handleStartButtonCallback() {
        isOnboardingCompleted = true
    }
}
