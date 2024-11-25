//
//  NetworkManager.swift
//  CityWeather
//
//  Created by amy on 2024-11-23.
//

import Foundation
import Combine

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func fetchData(url: URL) -> AnyPublisher<Data, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .catch { error in
                Fail(error: error).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
