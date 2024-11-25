//
//  WeatherModel.swift
//  CityWeather
//
//  Created by amy on 2024-11-22.
//
import Foundation

struct WeatherModel: Identifiable {
    let id = UUID()
    let cityName: String
    
    let temp_c: Double
    let humidity: Double
    let uv: Double
    let feelslike_c: Double
    let img_url: String
}
