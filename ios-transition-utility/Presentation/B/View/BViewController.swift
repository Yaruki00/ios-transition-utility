//
//  BViewController.swift
//  ios-transition-utility
//
//  Created by Yuta Kawabe on 2019/05/29.
//  Copyright © 2019年 yuta kawabe. All rights reserved.
//

import Foundation
import UIKit

final class BViewController: UIViewController, TransitableView {
    
    lazy var presenter: BPresenter = BPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BViewController {
    
    @IBAction private func switchWithADidTap() {
        self.presenter.switchWithADidTap()
    }
    
    @IBAction private func presentCDidTap() {
        self.presenter.presentCDidTap()
    }
    
    @IBAction private func pushCDidTap() {
        self.presenter.pushCDidTap()
    }
}
