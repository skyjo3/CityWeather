//
//  Icon.swift
//  CityWeather
//
//  Created by amy on 2024-11-28.
//

import SwiftUI

enum SystemIcon: String {
    case search = "magnifyingglass"
    case location = "location.fill"
    case placeholder = "sun.snow.fill"
    
    var image: Image {
        return Image(systemName: self.rawValue)
    }
}
