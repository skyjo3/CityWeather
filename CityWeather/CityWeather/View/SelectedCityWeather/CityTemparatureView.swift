//
//  CityTemparatureView.swift
//  CityWeather
//
//  Created by amy on 2024-11-22.
//

import SwiftUI

struct CityTemparatureView: View {
    
    var cityTemparature: Double
    
    var body: some View {
        Text("\(cityTemparature, specifier: "%.\(number_decimal)f")°")
            .customFont(.title2)
    }
}