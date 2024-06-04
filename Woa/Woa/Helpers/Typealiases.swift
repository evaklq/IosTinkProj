//
//  Typealiases.swift
//  Woa
//
//  Created by Mac on 2024-03-20.
//

import Foundation

typealias CompletionHandler = () -> Void
typealias CompletionHandlerWithValue<ResultValue> = ((ResultValue) -> Void)
