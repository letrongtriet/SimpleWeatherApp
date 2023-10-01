//
//  WeatherDetailView.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import SwiftUI

struct WeatherDetailView: View {
    let cityWeather: CityWeather

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(cityWeather.city)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.black)

            LottieView(name: cityWeather.weatherCondition.weatherAnimationName)
                .frame(width: 150, height: 150)

            Text("\(Int(cityWeather.weatherCondition.main.temp))°")
                .font(.largeTitle)

            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Feel like: \(Int(cityWeather.weatherCondition.main.feelsLike))")
                        .font(.body)
                        .foregroundColor(.secondary)

                    Text("High: \(Int(cityWeather.weatherCondition.main.tempMax))")
                        .font(.body)
                        .foregroundColor(.secondary)

                    Text("Low: \(Int(cityWeather.weatherCondition.main.tempMin))")
                        .font(.body)
                        .foregroundColor(.secondary)

                    Text("Humidity: \(Int(cityWeather.weatherCondition.main.humidity ?? 0))")
                        .font(.body)
                        .foregroundColor(.secondary)

                    Text("Visibility: \(Int(cityWeather.weatherCondition.visibility))m")
                        .font(.body)
                        .foregroundColor(.secondary)
                }

                Spacer()
            }
            .padding([.horizontal], 16)
            .padding([.top], 48)


            Spacer()
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

#Preview {
    WeatherDetailView(cityWeather:
            .init(
                city: "Mountain View",
                weatherCondition: .init(
                    weather: [
                        .init(
                            id: 721,
                            main: "Haze",
                            description: "haze",
                            icon: "50n"
                        )
                    ],
                    main: .init(
                        temp: 13.42,
                        feelsLike: 12.93,
                        tempMin: 11.12,
                        tempMax: 15.9,
                        pressure: 1009,
                        humidity: 81,
                        seaLevel: nil,
                        grndLevel: nil
                    ),
                    visibility: 10000,
                    wind: .init(
                        speed: 3.6,
                        deg: 170,
                        gust: nil
                    )
                )
            )
    )
}

