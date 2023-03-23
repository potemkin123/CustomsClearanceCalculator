//
//  ProductionYear.swift
//  CustomsClearanceCalculator
//
//  Created by Владислав Юрченко on 08.03.2023.
//ProductionYear (цена)
//2015 - 2023. ДО 2018 года - +500 цена, с 2018 - 2023 - +100 цена

enum Production: CaseIterable {
    case y2015
    case y2016
    case y2017
    case y2018
    case y2019
    case y2020
    case y2021
    case y2022
    case y2023
    init(title: String) {
        if title == "2015" {
            self = .y2015
        } else if title == "2016" {
            self = .y2016
        } else if title == "2017" {
            self = .y2017
        } else if title == "2018" {
            self = .y2018
        } else if title == "2019" {
            self = .y2019
        } else if title == "2020" {
            self = .y2020
        } else if title == "2021" {
            self = .y2021
        } else if title == "2022" {
            self = .y2022
        } else if title == "2023" {
            self = .y2023
        }
        else {
            self = .y2015
        }
    }
    var title: String {
        switch self {
        case .y2015:
            return "2015"
        case .y2016:
            return "2016"
        case .y2017:
            return "2017"
        case .y2018:
            return "2018"
        case .y2019:
            return "2019"
        case .y2020:
            return "2020"
        case .y2021:
            return "2021"
        case .y2022:
            return "2022"
        case .y2023:
            return "2023"
        }
    }
    var value: Int {
        switch self {
        case .y2015:
            return 500
        case .y2016:
            return 500
        case .y2017:
            return 500
        case .y2018:
            return 500
        case .y2019:
            return 1000
        case .y2020:
            return 1000
        case .y2021:
            return 1000
        case .y2022:
            return 1000
        case .y2023:
            return 1000
            
        }
    }
}
