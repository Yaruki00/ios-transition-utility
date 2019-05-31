//
//  TransitableView.swift
//  ios-transition-utility
//
//  Created by Yuta Kawabe on 2019/05/29.
//  Copyright © 2019年 yuta kawabe. All rights reserved.
//

import Foundation
import UIKit

// 画面遷移するViewControllerが適合するプロトコル
protocol TransitableView {
    func transit<T: UIViewController, S: TransitionDependencies>(_ transitable: Transitable<T, S>)
}

// やることは決まっているのでprotocol extensionで実装する
extension TransitableView where Self: UIViewController {
    
    // 画面遷移を実行するメソッド
    func transit<T: UIViewController, S: TransitionDependencies>(_ transitable: Transitable<T, S>) {
        switch transitable.type {
        case .root:
            let vc = self.instantiateVC(transitable)
            UIApplication.shared.keyWindow?.rootViewController = vc
        case .tab(let index):
            // タブの場合はTabControllerを持ってるやつに向けて通知を送る
            NotificationCenter.default.post(name: .tabWillSwitch, object: nil, userInfo: [Notification.ObjectKey.index: index])
        case .push(let animated):
            let vc = self.instantiateVC(transitable)
            self.navigationController?.pushViewController(vc, animated: animated)
        case .pop(let animated):
            self.navigationController?.popViewController(animated: animated)
        case .present(let animated, let completion):
            let vc = self.instantiateVC(transitable)
            self.view.window?.rootViewController?.present(vc, animated: animated, completion: completion)
        case .dismiss(let animated, let completion):
            self.dismiss(animated: animated, completion: completion)
        }
    }
    
    // ViewControllerを生成し、必要ならデータを渡すメソッド
    private func instantiateVC<T: UIViewController, S: TransitionDependencies>(_ transitable: Transitable<T, S>) -> UIViewController {
        let vc: UIViewController = transitable.withoutStoryboard ? T() : T.instantiate()
        if !(transitable.dependencies is EmptyTransitionDependencies) {
            guard let acceptableVC = vc as? TransitionDependenciesAcceptableViewController else {
                fatalError("\(vc) doesn't confirm TransitionDependenciesAcceptableViewController")
            }
            acceptableVC.setDependencies(dependencies: transitable.dependencies)
        }
        return transitable.withNavigationController ? UINavigationController(rootViewController: vc) : vc
    }
}
