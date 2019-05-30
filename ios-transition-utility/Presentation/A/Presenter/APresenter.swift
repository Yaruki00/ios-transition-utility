//
//  APresenter.swift
//  ios-transition-utility
//
//  Created by Yuta Kawabe on 2019/05/29.
//  Copyright © 2019年 yuta kawabe. All rights reserved.
//

import Foundation

final class APresenter {
    
    var view: AViewController
    private let text = "from A"
    
    init(view: AViewController) {
        self.view = view
    }
}

extension APresenter {
    
    func switchWithBDidTap() {
        self.view.transit(Transitions.switchWithB)
    }
    
    func presentCDidTap() {
        self.view.transit(Transitions.presentC(text: self.text))
    }
    
    func pushCDidTap() {
        self.view.transit(Transitions.pushC(text: self.text))
    }
}
