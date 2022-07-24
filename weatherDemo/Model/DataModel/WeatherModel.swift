//
//  WeatherModel.swift
//  weatherDemo
//
//  Created by 许远备 on 2022/7/24.
//

import Foundation
struct WeatherModel:Codable{
    let weather : [WeatherDes]
    let main : Main
}
struct WeatherDes : Codable {
        let main : String
        let icon : String
}
struct Main : Codable{
    let temp : Double
}

