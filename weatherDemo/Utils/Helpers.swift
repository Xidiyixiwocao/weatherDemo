//
//  Helpers.swift
//  weatherDemo
//
//  Created by 许远备 on 2022/7/20.
//

import Foundation
import Combine
import Metal
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
extension Array{
    func zipArray<T>(_ secondArray:[T]) -> [(Element,T)] {
        var result: [(Element,T)] = []
        for index in 0...self.count-1{
            let a = self[index]
            let b = secondArray[index]
            result.append((a,b))
        }
        return result
    }
}

