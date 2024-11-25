//
//  CityTextView.swift
//  CityWeather
//
//  Created by amy on 2024-11-22.
//

import SwiftUI

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        HStack {
            Text(cityName)
                .customFont(.title)
            Image(systemName: city_text_icon_name)
        }
    }
}
