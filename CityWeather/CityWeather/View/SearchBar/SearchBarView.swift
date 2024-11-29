//
//  SearchBarView.swift
//  CityWeather
//
//  Created by amy on 2024-11-22.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        VStack {
            TextField("Search Location", text: $searchText)
                .customFont(.callout)
                .padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20))
                .background(Color(.systemGray6))
                .cornerRadius(16)
                .overlay(
                    HStack {
                        Spacer()
                        SystemIcon.search.image
                            .foregroundColor(.gray)
                            .padding(.trailing, 20)
                    }
                )
                .padding(.horizontal, 24)
        }
        .navigationTitle("Search")
        .refreshable {}
    }
}
