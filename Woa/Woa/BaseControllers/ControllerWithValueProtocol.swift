//
//  ControllerWithValueProtocol.swift
//  Woa
//
//  Created by Mac on 2024-03-20.
//

import UIKit

protocol ControllerWithValueProtocol: AnyObject {
    associatedtype ResultValue
    var flowCompletionHandlerWithValue: CompletionHandlerWithValue<ResultValue>? { get set }
}
