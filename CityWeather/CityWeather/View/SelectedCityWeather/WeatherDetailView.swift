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
                .foregroundStyle(CustomColor.gray.color)
            Text(info)
                .customFont(.caption2)
                .foregroundStyle(CustomColor.darkGray.color)
        }
    }
}
