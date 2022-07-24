//
//  CityList.swift
//  weatherDemo
//
//  Created by 许远备 on 2022/7/20.
//

import SwiftUI

struct CityList: View {
    @EnvironmentObject var store: Store
    @State var expandingCityName: String?
    let defaultData = CityWeatherViewModel.all
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(store.appState.cityWeatherViewModels ){cityWeather in
                    CityCell(expanded: self.expandingCityName ==  cityWeather.cityName, model: cityWeather)
                    .onTapGesture {
                       withAnimation(
                        .spring(
                            response: 0.55,
                            dampingFraction: 0.425,
                            blendDuration: 0
                            )
                        ){
                            if self.expandingCityName == cityWeather.cityName{
                            self.expandingCityName = nil
                            }else {
                            self.expandingCityName = cityWeather.cityName
                                    }
                                }
                            }
                }
            }
        }.onAppear{
            self.store.dispatch(.loadCityWeather)
        }
    }
}

struct CityList_Previews: PreviewProvider {
    static var previews: some View {
        CityList()
    }
}
