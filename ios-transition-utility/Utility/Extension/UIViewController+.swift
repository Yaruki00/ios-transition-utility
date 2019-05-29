//
//  UIViewController+.swift
//  ios-transition-utility
//
//  Created by Yuta Kawabe on 2019/05/29.
//  Copyright © 2019年 yuta kawabe. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController: StoryBoardInstantiatable {}

protocol StoryBoardInstantiatable {}

extension StoryBoardInstantiatable where Self: UIViewController {
    
    static func instantiate() -> Self {
        let bundle = Bundle(for: self.self)
        let name = String(describing: self.self)
        
        guard let vc = UIStoryboard(name: name, bundle: bundle).instantiateInitialViewController() as? Self else {
            fatalError("UIViewController.instantiate() failed: \(name)")
        }
        
        return vc
    }
}
