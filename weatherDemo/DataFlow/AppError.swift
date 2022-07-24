//
//  AppError.swift
//  weatherDemo
//
//  Created by 许远备 on 2022/7/20.
//

import Foundation
enum AppError: Error, Identifiable {
    var id: String { localizedDescription }
    case networkingFailed(Error)
}
