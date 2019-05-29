//
//  Transitions.swift
//  ios-transition-utility
//
//  Created by Yuta Kawabe on 2019/05/29.
//  Copyright © 2019年 yuta kawabe. All rights reserved.
//

import Foundation
import UIKit

final class Transitions {
    
    typealias SimplePop = Transitable<UIViewController, EmptyTransitionDependencies>
    
    static var simplePop: SimplePop {
        return  Transitable<UIViewController, EmptyTransitionDependencies>(
            vcType: UIViewController.self,
            dependencies: EmptyTransitionDependencies(),
            type: .pop(animated: true)
        )
    }
    
    typealias SimpleDismiss = Transitable<UIViewController, EmptyTransitionDependencies>
    
    static var simpleDismiss: SimpleDismiss {
        return  Transitable<UIViewController, EmptyTransitionDependencies>(
            vcType: UIViewController.self,
            dependencies: EmptyTransitionDependencies(),
            type: .dismiss(animated: true, completion: nil)
        )
    }
}
