//
//  AViewController.swift
//  ios-transition-utility
//
//  Created by Yuta Kawabe on 2019/05/29.
//  Copyright © 2019年 yuta kawabe. All rights reserved.
//

import Foundation
import UIKit

final class AViewController: UIViewController, TransitableView {
    
    lazy var presenter: APresenter = APresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AViewController {
    
    @IBAction private func switchWithBDidTap() {
        self.presenter.switchWithBDidTap()
    }
    
    @IBAction private func presentCDidTap() {
        self.presenter.presentCDidTap()
    }
    
    @IBAction private func pushCDidTap() {
        self.presenter.pushCDidTap()
    }
}
