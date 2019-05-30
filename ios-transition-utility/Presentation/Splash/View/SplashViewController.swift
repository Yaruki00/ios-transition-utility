//
//  SplashViewController.swift
//  ios-transition-utility
//
//  Created by Yuta Kawabe on 2019/05/29.
//  Copyright © 2019年 yuta kawabe. All rights reserved.
//

import Foundation
import UIKit

final class SplashViewController: UIViewController, TransitableView {
    
    lazy var presenter: SplashPresenter = SplashPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.presenter.viewDidLoad()
        }
    }
}
