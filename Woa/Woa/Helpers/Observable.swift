//
//  Observable.swift
//  Woa
//
//  Created by evaklq on 2024-04-10.
//

import Foundation

final class Observable<T> {
    // MARK: - Declaration objects
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    private var listener: ((T?) -> Void)?

    // MARK: - Init
    init(_ value: T?) {
        self.value = value
    }

    func bind(_ listener: @escaping ((T?) -> Void)) {
        listener(value)
        self.listener = listener
    }
}
