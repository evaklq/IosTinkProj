//
//  TabBarDelegateProtocol.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

protocol TabBarDelegateProtocol: AnyObject {
    var onViewDidAppear: ((UINavigationController) -> Void)? { get set }
    var onFamousArtsFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onArtsStoreFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onCartFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onProfileFlowSelect: ((UINavigationController) -> Void)? { get set }
}
