//
//  SearchPreviewListItem.swift
//  CityWeather
//
//  Created by amy on 2024-11-22.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchPreviewListItem: View {
    
    var cityWeather: CityListModel
    
    var body: some View {
        ZStack {
            Color(Color(hex: preview_list_bg_hex))
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(cityWeather.cityName)
                        .customFont(.title3)
                        .scaledToFit()
                    Text("\(cityWeather.temp_c, specifier: "%.\(number_decimal)f")°")
                        .customFont(.body)
                        .scaledToFit()
                }
                Spacer()
                WebImage(url: URL(string: "https:\(cityWeather.img_url)")) { image in
                    image.resizable()
                } placeholder: {
                    Image(systemName: placeholder_img_name)
                }
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
            }
            .padding(EdgeInsets(top: 40, leading: 30, bottom: 20, trailing: 20))
        }
        .frame(height: 120)
        .cornerRadius(16)
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
    }
}
