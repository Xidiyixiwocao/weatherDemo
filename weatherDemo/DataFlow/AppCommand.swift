//
//  AppCommand.swift
//  weatherDemo
//
//  Created by 许远备 on 2022/7/24.
//
import Foundation
import Combine
import Kingfisher
protocol AppCommand {
    func execute(in store: Store)
}

struct LoadCityWeatherCommand: AppCommand {
    func execute(in store: Store) {
        let token = SubscriptionToken()
        LoadWeatherRequest.all.sink(
            receiveCompletion: {completion in
                if case .failure(let error) = completion {
                    store.dispatch(.loadCityWeatherDone(result: .failure(error)))
                }
                token.unseal()
            }
            , receiveValue: {value in
                store.dispatch(.loadCityWeatherDone(result: .success(value)))
            })
        .seal(in: token)

    }
}
class SubscriptionToken {
    var cancellable: AnyCancellable?
    func unseal() { cancellable = nil }
}
extension AnyCancellable {
    func seal(in token: SubscriptionToken) {
        token.cancellable = self
    }
}
