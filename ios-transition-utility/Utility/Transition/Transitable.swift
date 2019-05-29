//
//  Transitable.swift
//  ios-transition-utility
//
//  Created by Yuta Kawabe on 2019/05/29.
//  Copyright © 2019年 yuta kawabe. All rights reserved.
//

import Foundation
import UIKit

struct Transitable<T: UIViewController, S: TransitionDependencies> {
    let vcType: T.Type
    let dependencies: S
    let type: TransitionType
    let withNavigationController: Bool
    let withoutStoryboard: Bool
}

extension Transitable {
    init(vcType: T.Type, dependencies: S, type: TransitionType) {
        self.vcType = vcType
        self.dependencies = dependencies
        self.type = type
        self.withNavigationController = false
        self.withoutStoryboard = false
    }
}

protocol TransitionDependencies {}

struct EmptyTransitionDependencies: TransitionDependencies {}

protocol TransitionDependenciesAcceptable {
    func setDepencies<T: TransitionDependencies>(depencies: T)
}

typealias TransitionDependenciesAcceptableViewController = UIViewController & TransitionDependenciesAcceptable

enum TransitionType {
    case root
    case tab(index: Int)
    case push(animated: Bool)
    case pop(animated: Bool)
    case present(animated: Bool, completion: (() -> Void)?)
    case dismiss(animated: Bool, completion: (() -> Void)?)
}
