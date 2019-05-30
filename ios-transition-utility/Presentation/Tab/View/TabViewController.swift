//
//  TabViewController.swift
//  ios-transition-utility
//
//  Created by Yuta Kawabe on 2019/05/29.
//  Copyright © 2019年 yuta kawabe. All rights reserved.
//

import Foundation
import UIKit

final class TabViewController: UITabBarController, TransitableView {
    
    lazy var presenter: TabPresenter = TabPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.switchTab(_:)), name: .tabWillSwitch, object: nil)
    }
    
    @objc private func switchTab(_ notification: Notification) {
        if let index = notification.userInfo?[Notification.ObjectKey.index] as? Int {
            self.selectedIndex = index
        }
    }
}
