//
//  ContentViewModel.swift
//  CityWeather
//
//  Created by amy on 2024-11-23.
//

import SwiftUI
import Combine

final class ContentViewModel: ObservableObject {
    
    @Published var cityNameSearched: String = "" {
        didSet {
            fetchCityList()
        }
    }
    @Published var cityListData: [CityListModel]? = nil
    @Published var selectedCityName: String = ""
    @Published var selectedCityData: WeatherModel? = nil

    private var cancellables: Set<AnyCancellable> = []
    
    private let baseURL = "https://api.weatherapi.com/v1/"
    private let apiKey = "b34c5846ac5947afa4260130242411"
    
    func fetchCityList() {
        guard let url = URL(string: "\(baseURL)search.json?key=\(apiKey)&q=\(cityNameSearched)") else {
            print("Invalid URL")
            return
        }
        
        NetworkManager.shared.fetchData(url: url)
            .receive(on: DispatchQueue.main)
            .tryMap { data in
                try JSONDecoder().decode([CityListData].self, from: data)
            }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Data fetched successfully")
                case .failure(let error):
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] data in
                print(data)
                self?.cityListData = []
                for city in data {
                    self?.fetchWeatherListData(cityName: city.name)
                }
            })
            .store(in: &cancellables)
    }
    
    func fetchWeatherData() {
        guard let url = URL(string: "\(baseURL)current.json?key=\(apiKey)&q=\(selectedCityName)") else {
            print("Invalid URL")
            return
        }

        NetworkManager.shared.fetchData(url: url)
            .receive(on: DispatchQueue.main)
            .tryMap { data in
                try JSONDecoder().decode(WeatherData.self, from: data)
            }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Data fetched successfully")
                case .failure(let error):
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] data in
                let img_url = data.current.condition.icon
                let replaced_img_url = img_url.replacingOccurrences(of: "64x64", with: "128x128")
                self?.selectedCityData = WeatherModel(cityName: self?.selectedCityName ?? "",
                                                      temp_c: data.current.temp_c,
                                                      humidity: data.current.humidity,
                                                      uv: data.current.uv,
                                                      feelslike_c: data.current.feelslike_c,
                                                      img_url: replaced_img_url)
                UserDefaults.standard.set(self?.selectedCityName, forKey: "savedCity")
            })
            .store(in: &cancellables)
    }
    
    func fetchWeatherListData(cityName: String) {
        guard let url = URL(string: "\(baseURL)current.json?key=\(apiKey)&q=\(cityName)") else {
            print("Invalid URL")
            return
        }

        NetworkManager.shared.fetchData(url: url)
            .receive(on: DispatchQueue.main)
            .tryMap { data in
                try JSONDecoder().decode(WeatherData.self, from: data)
            }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Data fetched successfully")
                case .failure(let error):
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] data in
                let img_url = data.current.condition.icon
                let replaced_img_url = img_url.replacingOccurrences(of: "64x64", with: "128x128")
                self?.cityListData?.append(CityListModel(cityName: cityName,
                                                        temp_c: data.current.temp_c,
                                                         img_url: replaced_img_url))
            })
            .store(in: &cancellables)
    }
}
