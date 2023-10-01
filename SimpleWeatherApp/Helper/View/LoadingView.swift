//
//  LoadingView.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import SwiftUI

/**
 The generic loading view to replace the boring default loading indicator
 */
struct LoadingView: View {
    var body: some View {
        LottieView(name: "loading")
            .frame(maxWidth: 120, maxHeight: 120)
    }
}

#Preview {
    LoadingView()
}
