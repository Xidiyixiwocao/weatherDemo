//
//  CityList.swift
//  weatherDemo
//
//  Created by 许远备 on 2022/7/20.
//

import SwiftUI

struct CityList: View {
    @State var expandingCityName: String?
  //  let data : CityWeatherViewModel
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(CityWeatherViewModel.all){cityWeather in
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
            print("aaaaa")
           // self.dataModel.requestAllModel()
        }
    }
}

struct CityList_Previews: PreviewProvider {
    static var previews: some View {
     //   Text("sa")
     //   CityList(data: CityWeatherViewModel(city: CityWeather(cityName: "aa")))
        CityList()
    }
}
