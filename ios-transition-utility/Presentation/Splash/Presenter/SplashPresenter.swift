//
//  SplashPresenter.swift
//  ios-transition-utility
//
//  Created by Yuta Kawabe on 2019/05/29.
//  Copyright © 2019年 yuta kawabe. All rights reserved.
//

import Foundation

final class SplashPresenter {
    
    var view: SplashViewController
    
    init(view: SplashViewController) {
        self.view = view
    }
    
    func viewDidLoad() {
        self.view.transit(Transitions.toTab)
    }
}
