//
//  WeatherData.swift
//  CityWeather
//
//  Created by amy on 2024-11-22.
//

struct WeatherData: Codable {
    let current: CurrentWeatherData
}

struct CurrentWeatherData: Codable {
    let temp_c: Double
    let humidity: Double
    let uv: Double
    let feelslike_c: Double
    let condition: CurrentWeatherConditionData
}

struct CurrentWeatherConditionData: Codable {
    let icon: String
}
