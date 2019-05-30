//
//  Transitions+A.swift
//  ios-transition-utility
//
//  Created by Yuta Kawabe on 2019/05/30.
//  Copyright © 2019年 yuta kawabe. All rights reserved.
//

import Foundation
import UIKit

extension Transitions {
    
    typealias SwitchWithA = Transitable<AViewController, EmptyTransitionDependencies>
    
    static var switchWithA: SwitchWithA {
        return Transitable<AViewController, EmptyTransitionDependencies>(
            vcType: AViewController.self,
            dependencies: EmptyTransitionDependencies(),
            type: .tab(index: 0)
        )
    }
}
