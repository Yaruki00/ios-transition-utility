//
//  BPresenter.swift
//  ios-transition-utility
//
//  Created by Yuta Kawabe on 2019/05/29.
//  Copyright © 2019年 yuta kawabe. All rights reserved.
//

import Foundation

final class BPresenter {
    
    var view: BViewController
    private let text = "from B"
    
    init(view: BViewController) {
        self.view = view
    }
}

extension BPresenter {
    
    func switchWithADidTap() {
        self.view.transit(Transitions.switchWithA)
    }
    
    func presentCDidTap() {
        self.view.transit(Transitions.presentC(text: self.text))
    }
    
    func pushCDidTap() {
        self.view.transit(Transitions.pushC(text: self.text))
    }
}
