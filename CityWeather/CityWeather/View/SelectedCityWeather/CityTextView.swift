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
            SystemIcon.location.image
        }
    }
}
