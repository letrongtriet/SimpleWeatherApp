//
//  OnboardingViewModelTests.swift
//  SimpleWeatherAppTests
//
//  Created by Triet Le on 30.9.2023.
//

import XCTest
import SwiftUI
@testable import SimpleWeatherApp

final class OnboardingViewModelTests: XCTestCase {
    let viewModel = OnboardingViewModel()
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted: Bool = false

    func testValueAfterOnboardingComplete() {
        viewModel.finishOnboarding()
        XCTAssertTrue(isOnboardingCompleted)
    }
}
