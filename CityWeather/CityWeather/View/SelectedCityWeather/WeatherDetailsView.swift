//
//  WeatherDetailsView.swift
//  CityWeather
//
//  Created by amy on 2024-11-22.
//

import SwiftUI

struct WeatherDetailsView: View {
    
    var humidity: Double
    var uv: Double
    var temparature: Double
    
    var body: some View {
        ZStack {
            Color(Color(hex: weather_details_bg_hex))
            HStack(spacing: 40) {
                WeatherDetailView(title: "Humidity",
                                  info: String(format: "%.\(number_decimal)f", humidity)+"%")
                
                WeatherDetailView(title: "UV",
                                  info: String(format: "%.\(number_decimal)f", uv))
                
                WeatherDetailView(title: "Feels Like",
                                  info: String(format: "%.\(number_decimal)f°", temparature))
            }
            .padding(30)
        }
        .frame(width: 274, height: 75)
        .cornerRadius(16)
    }
}
