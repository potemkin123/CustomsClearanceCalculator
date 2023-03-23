//
//  Country.swift
//  CustomsClearanceCalculator
//
//  Created by Владислав Юрченко on 11.03.2023.
//

import Foundation
enum Country: Double, CaseIterable {
    case Ukraine = 1.0
    case USA = 1.2
    
    init(value: Int) {
        if value == 0 {
            self = .Ukraine
        } else if value == 1 {
            self = .USA
        }
        else {
                    self = .Ukraine
                }
    }
    var title: String {
        switch self {
        case .Ukraine:
            return "Ukraine"
        case .USA:
            return "USA"
            
        }
  }
//    var value: Double {
//        switch self {
//        case .Ukraine:
//            return 1.0
//       case .USA:
//           return 1.2
//        }
//    }
}
