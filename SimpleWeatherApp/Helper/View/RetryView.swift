//
//  RetryView.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import SwiftUI

/**
 The generic retry view
    - extension in future to support more error cases
 */
struct RetryView: View {
    let retryCallback: (() -> ())?

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            LottieView(name: "somethingwentwrong")
                .frame(maxWidth: 400, maxHeight: 400)

            Text("Something went wrong")
                .font(.body)

            Button(action: {
                retryCallback?()
            }) {
                HStack(spacing: 8) {
                    Text("Retry")
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(
                    Capsule().strokeBorder(Color.black, lineWidth: 1)
                )
                .padding([.top], 12)
            }
            .accentColor(Color.black)
        }
    }
}

#Preview {
    RetryView(retryCallback: nil)
}
