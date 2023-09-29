//
//  MainView.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import SwiftUI

struct MainView: View {
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted: Bool?

    var body: some View {
        VStack {
            if isOnboardingCompleted == true {

            } else {
                OnboardingView(viewModel: .init())
            }
        }
    }
}

#Preview {
    MainView()
}
