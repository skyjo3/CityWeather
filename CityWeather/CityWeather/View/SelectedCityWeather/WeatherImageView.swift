//
//  WeatherImageView.swift
//  CityWeather
//
//  Created by amy on 2024-11-22.
//

import SwiftUI
import SDWebImageSwiftUI

struct WeatherImageView: View {
    
    var imageName: String
    
    var body: some View {
        WebImage(url: URL(string: "https:\(imageName)")) { image in
            image.resizable()
        } placeholder: {
            Image(systemName: placeholder_img_name)
        }
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 128, height: 128)
    }
}
