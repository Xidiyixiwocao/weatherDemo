//
//  LoadWeatherRequest.swift
//  weatherDemo
//
//  Created by 许远备 on 2022/7/20.
//

import Foundation
import Combine

struct LoadWeatherRequest: Identifiable{
    var id: Double{cityCoordinate.0}
    
    static var all: AnyPublisher<[WeatherModel], AppError> {
        [(57.7072326,11.9670171),//Gothenburg
         (59.3251172,18.0710935),//Stockholm
         (51.5073219,-0.1276474),//London
         (40.7127281,-74.0060152),//New York
         (52.5170365,13.3888599)//Berlin
        ]
        .map { LoadWeatherRequest(cityCoordinate: $0).publisher }
            .zipAll
    }
    let cityCoordinate: (Double,Double)
    var publisher: AnyPublisher<WeatherModel, AppError> {
        weatherPulisher(cityCoordinate)
   //         .map{CityWeatherViewModel(city: $0)}
            .mapError { AppError.networkingFailed($0) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    private func weatherPulisher(_ cityCoordinate: (Double,Double))-> AnyPublisher<WeatherModel, Error>{
        URLSession.shared
            .dataTaskPublisher(for: URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(cityCoordinate.0)&lon=\(cityCoordinate.1)&appid=b2729dd4ff34b31f998825d729fc41b2")!)
            .map{ $0.data }
            .decode(type: WeatherModel.self, decoder: appDecoder)
            .eraseToAnyPublisher()
    }
}
