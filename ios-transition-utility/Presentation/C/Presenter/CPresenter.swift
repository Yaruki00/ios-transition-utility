//
//  CPresenter.swift
//  ios-transition-utility
//
//  Created by Yuta Kawabe on 2019/05/29.
//  Copyright © 2019年 yuta kawabe. All rights reserved.
//

import Foundation

final class CPresenter {
    
    var view: CViewController
    
    init(view: CViewController) {
        self.view = view
    }
}

extension CPresenter {
    
    func dismissDidTap() {
        self.view.transit(Transitions.simpleDismiss)
    }
    
    func popDidTap() {
        self.view.transit(Transitions.simplePop)
    }
}
