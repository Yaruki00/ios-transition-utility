//
//  Transitions+C.swift
//  ios-transition-utility
//
//  Created by Yuta Kawabe on 2019/05/30.
//  Copyright © 2019年 yuta kawabe. All rights reserved.
//

import Foundation
import UIKit

struct CDependencies: TransitionDependencies {
    let text: String
    let isPresented: Bool
    let isPushed: Bool
}

extension Transitions {
    
    typealias ToC = Transitable<CViewController, CDependencies>
    
    static func presentC(text: String) -> ToC {
        return Transitable<CViewController, CDependencies>(
            vcType: CViewController.self,
            dependencies: CDependencies(text: text, isPresented: true, isPushed: false),
            type: .present(animated: true, completion: nil)
        )
    }
    
    static func pushC(text: String) -> ToC {
        return Transitable<CViewController, CDependencies>(
            vcType: CViewController.self,
            dependencies: CDependencies(text: text, isPresented: false, isPushed: true),
            type: .push(animated: true)
        )
    }
}
