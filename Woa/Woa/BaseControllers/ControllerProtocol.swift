//
//  ControllerProtocol.swift
//  Woa
//
//  Created by Mac on 2024-03-20.
//

import UIKit

protocol ControllerProtocol: AnyObject {
    var flowCompletionHandler: CompletionHandler? { get set }
}
