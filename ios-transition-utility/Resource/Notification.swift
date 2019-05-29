//
//  Notification.swift
//  ios-transition-utility
//
//  Created by Yuta Kawabe on 2019/05/29.
//  Copyright © 2019年 yuta kawabe. All rights reserved.
//

import Foundation

extension Notification.Name {
    
    static let tabWillSwitch = Notification.Name("tabWillSwitch")
}

extension Notification {
    
    enum ObjectKey: String {
        case index
    }
}
