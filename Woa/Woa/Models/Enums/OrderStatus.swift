//
//  OrderStatus.swift
//  Woa
//
//  Created by evaklq on 2024-05-22.
//

import Foundation

enum OrderStatus {
    case delivered, canceled, placed

    var description: String {
        switch self {
        case .delivered:
            return "Delivered"
        case .canceled:
            return "Canceled"
        case .placed:
            return "Placed"
        }
    }
}
