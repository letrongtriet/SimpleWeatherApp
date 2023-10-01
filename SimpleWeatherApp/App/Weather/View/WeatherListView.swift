//
//  WeatherListView.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import SwiftUI

struct WeatherListView: View {
    @ObservedObject var viewModel: WeatherListViewModel

    var body: some View {
        NavigationStack {
            ZStack() {
                VStack(spacing: 0) {
                    switch viewModel.state {
                    case .loading:
                        LoadingView()

                    case .retry:
                        RetryView {
                            Task {
                                await viewModel.fetchWeatherList()
                            }
                        }

                    case .results(let items):
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 24) {
                                ForEach(items, id: \.id) { item in
                                    NavigationLink {
                                        WeatherDetailView(cityWeather: item)
                                    } label: {
                                        WeatherCellView(item: item)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                    }
                }
                .task {
                    await viewModel.fetchWeatherList()
                }
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
                        Color("WeatherBackgroundStart"),
                        Color("WeatherBackgroundStop")
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
    }
}

#Preview {
    WeatherListView(viewModel: .init(service: WeatherServiceImplementation()))
}

