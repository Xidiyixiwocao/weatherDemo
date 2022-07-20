//
//  Helpers.swift
//  weatherDemo
//
//  Created by 许远备 on 2022/7/20.
//

import Foundation
import Combine
extension Array where Element: Publisher {
    var zipAll: AnyPublisher<[Element.Output], Element.Failure> {
        let initial = Just([Element.Output]())
            .setFailureType(to: Element.Failure.self)
            .eraseToAnyPublisher()
        return reduce(initial) { result, publisher in
            result.zip(publisher) { $0 + [$1] }.eraseToAnyPublisher()
        }
    }
}
let appDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()
