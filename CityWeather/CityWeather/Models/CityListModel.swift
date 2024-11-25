//
//  CityListModel.swift
//  CityWeather
//
//  Created by amy on 2024-11-23.
//
import Foundation

struct CityListModel: Identifiable {
    let id = UUID()
    let cityName: String
    let temp_c: Double
    let img_url: String
}
