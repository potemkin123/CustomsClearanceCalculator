//
//  ProductionYear.swift
//  CustomsClearanceCalculator
//
//  Created by Владислав Юрченко on 08.03.2023.
//ProductionYear (цена)
//2015 - 2023. ДО 2018 года - +500 цена, с 2018 - 2023 - +100 цена

//import Foundation
//enum Production: CaseIterable {
//    static func production (number: Int) -> String {
//        switch number {
//        case 1:
//            return "2015"
//        case 2:
//            return "2016"
//        case 3:
//            return "2017"
//        case 4:
//            return "2018"
//        case 5:
//            return "2019"
//        case 6:
//            return "2020"
//        case 7:
//            return "2021"
//        case 8:
//            return "2022"
//        case 9:
//            return "2023"
//        default:
//            return ""
//        }
//    }
//    var value: Int {
//        func production (value: Int) -> Int {
//            switch value {
//            case 1:
//                return +500
//            case 2:
//                return +500
//            case 3:
//                return +500
//            case 4:
//                return +500
//            case 5:
//                return +1000
//            case 6:
//                return +1000
//            case 7:
//                return +1000
//            case 8:
//                return +1000
//            case 9:
//                return +1000
//            default:
//                return 0
//            }
//        }
//        
//    }
//}
enum Production: CaseIterable {
    case a
    case b
    case c
    case d
    case e
    case f
    case g
    case h
    case i
    var title: String {
        switch self {
        case .a:
            return "2015"
        case .b:
            return "2016"
        case .c:
            return "2017"
        case .d:
            return "2018"
        case .e:
            return "2019"
        case .f:
            return "2020"
        case .g:
            return "2021"
        case .h:
            return "2022"
        case .i:
            return "2023"
        }
    }
    var value: Int {
        switch self {
        case .a:
            return +500
        case .b:
            return +500
        case .c:
            return +500
        case .d:
            return +500
        case .e:
            return +1000
        case .f:
            return +1000
        case .g:
            return +1000
        case .h:
            return +1000
        case .i:
            return +1000
            
        }
    }
}
