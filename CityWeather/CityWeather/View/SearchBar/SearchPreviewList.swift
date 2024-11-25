//
//  SearchPreviewList.swift
//  CityWeather
//
//  Created by amy on 2024-11-22.
//

import SwiftUI

struct SearchPreviewList: View {
    
    var cityWeatherData: [CityListModel]
    var onCitySelected: (CityListModel) -> Void
    
    let columns : [GridItem] = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid (columns: columns) {
                    ForEach(cityWeatherData) { data in
                        SearchPreviewListItem(cityWeather: data)
                            .onTapGesture {
                                onCitySelected(data)
                            }
                    }
                }
            }
        }
    }
}
