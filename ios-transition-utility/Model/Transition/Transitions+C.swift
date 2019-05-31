//
//  Transitions+C.swift
//  ios-transition-utility
//
//  Created by Yuta Kawabe on 2019/05/30.
//  Copyright © 2019年 yuta kawabe. All rights reserved.
//

import Foundation
import UIKit

// 画面Cで必要になるデータ
struct CDependencies: TransitionDependencies {
    let text: String
    let isPresented: Bool
    let isPushed: Bool
}

extension Transitions {
    
    typealias ToC = Transitable<CViewController, CDependencies>
    
    // 画面Cにpresentで遷移
    static func presentC(text: String) -> ToC {
        return Transitable<CViewController, CDependencies>(
            vcType: CViewController.self,
            dependencies: CDependencies(text: text, isPresented: true, isPushed: false),
            type: .present(animated: true, completion: nil)
        )
    }
    
    // 画面Cにpushで遷移
    static func pushC(text: String) -> ToC {
        return Transitable<CViewController, CDependencies>(
            vcType: CViewController.self,
            dependencies: CDependencies(text: text, isPresented: false, isPushed: true),
            type: .push(animated: true)
        )
    }
}
