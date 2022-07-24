//
//  AppAction.swift
//  weatherDemo
//
//  Created by 许远备 on 2022/7/24.
//

import Foundation
enum AppAction {
    case loadCityWeather
    case loadCityWeatherDone(result: Result<[WeatherModel], AppError>)
}
