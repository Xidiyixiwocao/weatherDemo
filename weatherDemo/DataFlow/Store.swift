//
//  Store.swift
//  weatherDemo
//
//  Created by 许远备 on 2022/7/24.
//

import Combine
class Store: ObservableObject {
    @Published var appState = AppState(cityWeatherViewModels: CityWeatherViewModel.all)
    static func reduce(state: AppState, action: AppAction) -> (AppState, AppCommand?){
        var appState = state
        var appCommand: AppCommand? = nil
        
        switch action {
        case .loadCityWeather:
            appCommand = LoadCityWeatherCommand()
        case .loadCityWeatherDone(let result):
            switch result {
            case .success(let models):
                appState.cityWeatherViewModels = models.zipArray(["Gothenburg","Stockholm","London","New York","Berlin"]).map{ cityWeather in
                    CityWeatherViewModel(weather: cityWeather.0, id: cityWeather.1, cityName: cityWeather.1)
                }
            case .failure(let error):
                print(error)
            }
        }
        return (appState, appCommand)
    }
    func dispatch(_ action: AppAction) {
        print("[ACTION]: \(action)")
        let result = Store.reduce(state: appState, action: action)
        appState = result.0
        if let command = result.1 {
            print("[COMMAND]: \(command)")
            command.execute(in: self)
        }
    }
}

