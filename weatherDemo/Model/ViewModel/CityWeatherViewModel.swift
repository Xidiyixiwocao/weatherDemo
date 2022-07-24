//
//  CityWeatherViewModel.swift
//  weatherDemo
//
//  Created by 许远备 on 2022/7/20.
//

import Foundation
import SwiftUI
struct CityWeatherViewModel: Identifiable, Codable{
  static  var defaultWeatherDes = WeatherDes(main: "--", icon: "")
    static var defaultMain = Main(temp: 0.00)
    var weather:WeatherModel
    var id: String
    var icon : String {weather.weather.first!.icon}
    var temp : Double {weather.main.temp}
    var mainDes : String {weather.weather.first!.main}
    var cityName: String
    var iconImageURL: URL {
        URL(string: "http://openweathermap.org/img/wn/\(icon)@2x.png")!
    }
    var color: Color { SwiftUI.Color(cityName) }
    static var all: [CityWeatherViewModel] = {
        ["Gothenburg","Stockholm","London","New York","Berlin"].map { cityName in
            let cityWetherViewModel = CityWeatherViewModel.init(weather: WeatherModel.init(weather: [defaultWeatherDes], main: defaultMain), id: cityName, cityName: cityName)
            return cityWetherViewModel
        }
    }()
}
