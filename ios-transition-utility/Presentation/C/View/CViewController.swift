//
//  CViewController.swift
//  ios-transition-utility
//
//  Created by Yuta Kawabe on 2019/05/29.
//  Copyright © 2019年 yuta kawabe. All rights reserved.
//

import Foundation
import UIKit

final class CViewController: TransitionDependenciesAcceptableViewController, TransitableView {
    
    
    @IBOutlet private weak var fromLabel: UILabel!
    @IBOutlet private weak var dismissButton: UIButton!
    @IBOutlet private weak var popButton: UIButton!
    
    lazy var presenter: CPresenter = CPresenter(view: self)
    private var dependencies: CDependencies?
    
    func setDependencies<T: TransitionDependencies>(dependencies: T) {
        self.dependencies = dependencies as? CDependencies
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    private func setupUI() {
        self.fromLabel.text = self.dependencies?.text
        self.dismissButton.isEnabled = self.dependencies?.isPresented ?? false
        self.popButton.isEnabled = self.dependencies?.isPushed ?? false
    }
}

extension CViewController {
    
    @IBAction private func dismissDidTap() {
        self.presenter.dismissDidTap()
    }
    
    @IBAction private func popDidTap() {
        self.presenter.popDidTap()
    }
}
