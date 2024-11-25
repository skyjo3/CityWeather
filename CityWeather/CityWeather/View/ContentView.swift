//
//  ContentView.swift
//  CityWeather
//
//  Created by amy on 2024-11-22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    @State private var searchText: String = ""
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            
            VStack {
                SearchBarView(searchText: Binding(
                    get: { viewModel.cityNameSearched },
                    set: { viewModel.cityNameSearched = $0 }
                ))
                Spacer()
                
                if let data = viewModel.selectedCityData,
                    data.cityName == viewModel.cityNameSearched {
                    VStack {
                        WeatherImageView(imageName: data.img_url)
                        CityTextView(cityName: viewModel.selectedCityName)
                        CityTemparatureView(cityTemparature: data.temp_c)
                        WeatherDetailsView(humidity: data.humidity,
                                           uv: data.uv,
                                           temparature: data.feelslike_c)
                    }
                } else if viewModel.cityNameSearched.isEmpty {
                    VStack {
                        Text("No City Selected")
                            .customFont(.headline)
                            .padding(.bottom, 2)
                        Text("Please search for a city")
                            .customFont(.subheadline)
                    }
                } else if let data = viewModel.cityListData {
                    SearchPreviewList(cityWeatherData: data) { city in
                        viewModel.cityNameSearched = city.cityName
                        viewModel.selectedCityName = city.cityName
                        viewModel.fetchWeatherData()
                    }
                }
                Spacer()
            }
        }
        .onAppear {
            if let savedCity = UserDefaults.standard.string(forKey: "savedCity") {
                viewModel.cityNameSearched = savedCity
                viewModel.selectedCityName = savedCity
                viewModel.fetchWeatherData()
            }
        }
    }
}

#Preview {
    ContentView()
}
