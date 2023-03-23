//
//  Type.swift
//  CustomsClearanceCalculator
//
//  Created by Владислав Юрченко on 07.03.2023.
//

import Foundation
enum Model: CaseIterable {
    
    case sedan
    case coupe
    case stationWagon
    case minivan
    
    init(title: String) {
        if title == "Sedan" {
            self = .sedan
        } else if title == "Coupe" {
            self = .coupe
        } else if title == "stationWagon" {
            self = .stationWagon
        } else if title == "Minivan" {
            self = .minivan
        }
        else {
                    self = .sedan
                }
    }
    var title: String {
        switch self {
        case .sedan:
            return "Sedan"
        case .coupe:
            return "Coupe"
        case .stationWagon:
            return "stationWagon"
        case .minivan:
            return "Minivan"
            
        }
    }
    var value: Int {
        switch self {
        case .sedan:
            return 50
        case .coupe:
            return 200
        case .stationWagon:
            return 300
        case .minivan:
            return 80
        }
    }
}
