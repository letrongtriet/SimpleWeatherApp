//
//  OnboardingItem.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import Foundation

/**
 - Parameters:
    - animationFileName: Lottie animation file name for animation
    - title: the tite for current onboarding screen
    - description: description for current onboarding screen
    - shouldShowStartButton: used only for last screen
    - startButtonCallback: come in pair with `shouldShowStartButton`
 */
struct OnboardingItem {
    let animationFileName: String
    let title: String
    let description: String
    let shouldShowStartButton: Bool
    let startButtonCallback: (() -> ())?

    init(animationFileName: String, 
         title: String,
         description: String,
         shouldShowStartButton: Bool,
         startButtonCallback: (() -> Void)? = nil
    ) {
        self.animationFileName = animationFileName
        self.title = title
        self.description = description
        self.shouldShowStartButton = shouldShowStartButton
        self.startButtonCallback = startButtonCallback
    }
}

extension OnboardingItem: Hashable, Equatable {
    static func == (lhs: OnboardingItem, rhs: OnboardingItem) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(animationFileName)
        hasher.combine(title)
        hasher.combine(description)
        hasher.combine(shouldShowStartButton)
    }
}
