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
            Color(CustomColor.lightGray.color)
            HStack(spacing: 40) {
                WeatherDetailView(title: "Humidity",
                                  info: String(format: "%.\(Constant.numberOfDecimal)f", humidity)+"%")
                
                WeatherDetailView(title: "UV",
                                  info: String(format: "%.\(Constant.numberOfDecimal)f", uv))
                
                WeatherDetailView(title: "Feels Like",
                                  info: String(format: "%.\(Constant.numberOfDecimal)f°", temparature))
            }
            .padding(30)
        }
        .frame(width: 274, height: 75)
        .cornerRadius(16)
    }
}
