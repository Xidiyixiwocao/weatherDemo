//
//  CityWeatherModel.swift
//  weatherDemo
//
//  Created by 许远备 on 2022/7/20.
//

import Foundation
import SwiftUI
struct CityWeather: Codable {
    var cityName:String
  //  var weatherIconURL:String = "http://openweathermap.org/img/wn/10d@2x.png"
    var weatherIconURL:String {
        return String("http://openweathermap.org/img/wn/10d@2x.png")
    }
  //  let weather:[Weather]
    var color: SwiftUI.Color {
        return SwiftUI.Color(cityName)
    }
}
struct Weather : Codable{
    let main : String
    let description : String
    let icon : String
}
