//
//  CityWeatherViewModel.swift
//  weatherDemo
//
//  Created by 许远备 on 2022/7/20.
//

import Foundation
import SwiftUI
struct CityWeatherViewModel: Identifiable, Codable{
    var city:CityWeather
    var id: String { city.cityName }
    var cityName: String { city.cityName }
    var iconImageURL: URL {
      //  URL(string: "http://openweathermap.org/img/wn/\(city.weatherIconURL)@2x.png")!
        URL(string: "http://openweathermap.org/img/wn/10d@2x.png")!
    }
    var color: Color { city.color }
    static var all: [CityWeatherViewModel] = {
        ["Gothenburg","Stockholm","London","New York","Berlin"].map { cityName in
            let cityWether = CityWeather.init(cityName: cityName)
            let cityWetherViewModel = CityWeatherViewModel.init(city: cityWether)
            return cityWetherViewModel
        }
    }()
}
