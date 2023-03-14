//
//  Brand.swift
//  CustomsClearanceCalculator
//
//  Created by Владислав Юрченко on 07.03.2023.
//

import Foundation
enum Brand: CaseIterable {
    case audi
    case bmw
    case mazda
    case mersedesBenz
    case volkswagen
    var title: String {
        switch self {
        case .audi:
            return "Audi"
        case .bmw:
            return "BMW"
        case .mazda:
            return "Mazda"
        case .mersedesBenz:
            return "MersedesBenz"
        case .volkswagen:
            return "Volkswagen"
        }
    }
    var value: Int {
        switch self {
        case .audi:
            return 1000
        case .bmw:
            return 1100
        case .mazda:
            return 400
        case .mersedesBenz:
            return 800
        case .volkswagen:
            return 600
        }
    }
}
