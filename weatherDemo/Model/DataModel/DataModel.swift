//
//  DataModel.swift
//  weatherDemo
//
//  Created by 许远备 on 2022/7/20.
//

import Foundation
import Combine
class DataModel:ObservableObject{
    @Published var allModel: [CityWeatherViewModel] = []
    func requestAllModel(){
//        LoadWeatherRequest.all.sink { completion in
//            print("bbbb")
//        } receiveValue: { models in
//            self.allModel = models
//            print("ddddd")
//        }
        
//        URLSession.shared
//            .dataTaskPublisher(for: URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=64&lon=11.1&appid=b2729dd4ff34b31f998825d729fc41b2")!)
//            .map{ $0.data }
//            .decode(type: CityWeather.self, decoder: appDecoder)
       // print(data)
        
//        URLSession.shared
//            .dataTaskPublisher(for: URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=64&lon=11.1&appid=b2729dd4ff34b31f998825d729fc41b2")!)
//            .sink { completion in
//                print("completion")
//            } receiveValue: { data,_ in
//                print(data)
//            }
        
//        URLSession.shared.dataTaskPublisher(for: URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b2729dd4ff34b31f998825d729fc41b2")!)
//            // 将请求结果中的 Data 转换为字符串，并忽略掉空结果，下面会详细介绍 compactMap
//            .compactMap {
//                String(data: $0.data, encoding: .utf8)
//            }
//            // 在主线程接受后续的事件 （上面的 compactMap 发生在 URLSession 的线程中）
//            .receive(on: RunLoop.main)
//            // 对最终的结果（请求结果对应的字符串）进行消费
//            .sink { _ in
//                //
//            } receiveValue: { resultString in
//                print( resultString)
//            }
     let test =   URLSession.shared.dataTaskPublisher(for: URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b2729dd4ff34b31f998825d729fc41b2")!)
            .map(\.data)
            .sink { completion in
                if case .failure(let error) =  completion {
                    print("DataImporter.runImport failed with error: \(error)")
                }
            } receiveValue: { data in
                print("=============")
            }
        print(test)

            // 将请求结果中的 Data 转换为字符串，并忽略掉空结果，下面会详细介绍 compactMap
          
    }
}
