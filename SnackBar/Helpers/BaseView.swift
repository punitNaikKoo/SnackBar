//
//  BaseView.swift
//  SnackBar
//
//  Created by Sai Kallepalli on 12/12/22.
//

import Foundation
import UIKit

var isDarkMode: Bool {
    guard #available(iOS 12.0, *) else {
        return false
    }
    let scene = UIApplication.shared.connectedScenes.first
    if let window: UIWindow = (scene?.delegate as? SceneDelegate)?.window {
        return window.traitCollection.userInterfaceStyle == .dark
    }
    return false
}

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateColors(isDarkMode: isDarkMode)
    }
    
    func updateColors(isDarkMode: Bool) { }
}

extension BaseView {
    @objc func commonInit() {
        
    }
}
