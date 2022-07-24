//
//  weatherDemoApp.swift
//  weatherDemo
//
//  Created by 许远备 on 2022/7/19.
//

import SwiftUI

@main
struct WeatherDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Store())
        }
    }
}
