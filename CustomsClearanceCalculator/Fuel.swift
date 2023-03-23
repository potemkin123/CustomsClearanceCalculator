//
//  Fuel.swift
//  CustomsClearanceCalculator
//
//  Created by Владислав Юрченко on 08.03.2023.
//FuelType (цена)
//petrol = 200
//diesel = 300
//gas = 150
//electro = 500


import Foundation
enum Fuel: CaseIterable {
    case petrol
    case diesel
    case gas
    case electro
    
    init(title: String) {
        if title == "Petrol" {
            self = .petrol
        } else if title == "Diesel" {
            self = .diesel
        } else if title == "Gas" {
            self = .gas
        } else if title == "Electro" {
            self = .electro
        }
        else {
                    self = .petrol
                }
    }
    var title: String {
        switch self {
        case .petrol:
            return "Petrol"
        case .diesel:
            return "Diesel"
        case .gas:
            return "Gas"
        case .electro:
            return "Electro"
        }
    }
    var value: Int {
        switch self {
        case .petrol:
            return 200
        case .diesel:
            return 300
        case .gas:
            return 150
        case .electro:
            return 500
        }
    }
}
