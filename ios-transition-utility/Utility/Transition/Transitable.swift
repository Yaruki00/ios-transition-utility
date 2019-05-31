//
//  Transitable.swift
//  ios-transition-utility
//
//  Created by Yuta Kawabe on 2019/05/29.
//  Copyright © 2019年 yuta kawabe. All rights reserved.
//

import Foundation
import UIKit

// 遷移情報をまとめた構造体
struct Transitable<T: UIViewController, S: TransitionDependencies> {
    let vcType: T.Type // ViewControllerのクラス、遷移によっては必要ないこともある
    let dependencies: S // 次の画面に渡すべきデータ
    let type: TransitionType // 遷移種別
    let withNavigationController: Bool // NavigationControllerをつけるか否か
    let withoutStoryboard: Bool // Storyboardを使わないか否か
}

extension Transitable {
    // 多いパターンのためのイニシャライザ
    // NavigationControllerはつけないことが多い
    // Storyboardは使うことが多い
    init(vcType: T.Type, dependencies: S, type: TransitionType) {
        self.vcType = vcType
        self.dependencies = dependencies
        self.type = type
        self.withNavigationController = false
        self.withoutStoryboard = false
    }
}

// 次の画面に渡すべきデータのためのプロトコル
// 中身は空だが、型に縛りをつけたいので使う
protocol TransitionDependencies {}

// 渡すデータがない場合に使う
struct EmptyTransitionDependencies: TransitionDependencies {}

// 前の画面からデータをもらうためのプロトコル
protocol TransitionDependenciesAcceptable {
    func setDependencies<T: TransitionDependencies>(dependencies: T)
}

// 前の画面からデータをもらう画面
// 若干だけど短くするため宣言
typealias TransitionDependenciesAcceptableViewController = UIViewController & TransitionDependenciesAcceptable

// 遷移種別
enum TransitionType {
    case root // windowのrootViewControllerを置き換える
    case tab(index: Int) // タブ切り替え
    case push(animated: Bool) // NavigationControllerの進む
    case pop(animated: Bool) // NavigationControllerの戻る
    case present(animated: Bool, completion: (() -> Void)?) // 開く
    case dismiss(animated: Bool, completion: (() -> Void)?) // 閉じる
}
