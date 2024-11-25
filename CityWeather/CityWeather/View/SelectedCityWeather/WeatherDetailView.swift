//
//  WeatherDetailView.swift
//  CityWeather
//
//  Created by amy on 2024-11-22.
//

import SwiftUI

struct WeatherDetailView: View {
    
    var title: String
    var info: String
    
    var body: some View {
        VStack {
            Text(title)
                .customFont(.caption)
                .foregroundStyle(Color(hex: weather_detail_title_hex))
            Text(info)
                .customFont(.caption2)
                .foregroundStyle(Color(hex: weather_detail_info_hex))
        }
    }
}
