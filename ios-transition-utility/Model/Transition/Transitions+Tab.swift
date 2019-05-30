//
//  Transitions+Tab.swift
//  ios-transition-utility
//
//  Created by Yuta Kawabe on 2019/05/29.
//  Copyright © 2019年 yuta kawabe. All rights reserved.
//

import Foundation
import UIKit

extension Transitions {
    
    typealias ToTab = Transitable<TabViewController, EmptyTransitionDependencies>
    
    static var toTab: ToTab {
        return Transitable<TabViewController, EmptyTransitionDependencies>(
            vcType: TabViewController.self,
            dependencies: EmptyTransitionDependencies(),
            type: .root
        )
    }
}

extension Transitions {
    
    typealias SwitchTab = Transitable<UIViewController, EmptyTransitionDependencies>
    
    static func switchTab(index: Int) -> SwitchTab {
        return Transitable<UIViewController, EmptyTransitionDependencies>(
            vcType: UIViewController.self,
            dependencies: EmptyTransitionDependencies(),
            type: .tab(index: index)
        )
    }
}
