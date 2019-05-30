//
//  Transitions+B.swift
//  ios-transition-utility
//
//  Created by Yuta Kawabe on 2019/05/30.
//  Copyright © 2019年 yuta kawabe. All rights reserved.
//

import Foundation
import UIKit

extension Transitions {
    
    typealias SwitchWithB = Transitable<BViewController, EmptyTransitionDependencies>
    
    static var switchWithB: SwitchWithB {
        return Transitable<BViewController, EmptyTransitionDependencies>(
            vcType: BViewController.self,
            dependencies: EmptyTransitionDependencies(),
            type: .tab(index: 1)
        )
    }
}
