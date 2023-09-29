//
//  WeatherCellView.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import SwiftUI

struct WeatherCellView: View {
    let item: CityWeather

    var body: some View {
        VStack {
            HStack {
                Text(item.city)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)

                Spacer()

                Text("\(Int(item.weatherCondition.main.temp))°")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding([.top], 8)
            .padding([.horizontal], 16)

            Spacer()

            HStack {
                Text(item.weatherCondition.weather.first?.main ?? "")
                    .font(.body)

                Spacer()

                Text("H:\(Int(item.weatherCondition.main.tempMax))°  L:\(Int(item.weatherCondition.main.tempMin))°")
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            .padding([.bottom], 8)
            .padding([.horizontal], 16)
        }
        .frame(height: 96)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color.black, lineWidth: 0.5)
        )
        .padding([.leading, .trailing], 16)
        .contentShape(Rectangle())
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
    }
}

#Preview {
    WeatherCellView(item:
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
