//
//  SnackBar.swift
//  SnackBar
//
//  Created by Sai Kallepalli on 13/12/22.
//

import Foundation
import EasyPeasy
import UIKit

extension UIImage {
    static let pencil = UIImage(systemName: "pencil.circle.fill")
}

func getWindow() -> UIWindow {
    return UIApplication.shared.windows[0]
}

class SnackBar {
    
    static let shared = SnackBar()
    private var autoHideInSecs: CGFloat = 50
    private init() {
        show(model: SnackModel(title: "Title"))
    }
    
    private var timer: Timer?
    private var snackView: SnackView?
    
    func show(model: SnackModel) {
        hideSnack(animated: false)
        let snak = SnackView()
        snak.theme = SnackTheme.post
        snackView = snak
        snak.update(model)
        
        let window = getWindow()
        snak.isHidden = true
        window.addSubview(snak)
        snak.easy.layout(
            Top(-200).to(window, .topMargin),
            Left(20),
            Right(20),
            Height(60)
        )
        
        hideSnack(animated: false)
        snak.isHidden = false
        showSnack(animated: true)
    }
    
    func hide(animated: Bool = true) {
        invalidateTimer()
        hideSnack(animated: animated)
    }
    
    private func hideSnack(animated: Bool) {
        UIView.animate(withDuration: animated ? 0.5 : 0, delay: 0.1) {
            self.snackView?.transform = .identity
        }
    }
    
    private func showSnack(animated: Bool) {
        UIView.animate(withDuration: animated ? 0.5 : 0, delay: 0.1, usingSpringWithDamping: 50, initialSpringVelocity: 10) {
            self.snackView?.transform = .init(translationX: 0, y: 200)
        } completion: { _ in
//            self.autoHideAfter(delay: 2)
        }
    }
    
    private func autoHideAfter(delay: CGFloat) {
        invalidateTimer()
        let timer = Timer(timeInterval: delay, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        self.timer = timer
        RunLoop.current.add(timer, forMode: .common)
    }
    
    @objc func fireTimer(timer: Timer) {
        print("Timer fired \(autoHideInSecs)")
        autoHideInSecs -= 1
        if autoHideInSecs == 0 {
            invalidateTimer()
            hideSnack(animated: true)
        }
    }
    
    private func invalidateTimer() {
        print("Invalidating timer")
        autoHideInSecs = 7
        timer?.invalidate()
        timer = nil
    }
}

import SwiftUI

struct ViewControllerPreview2: PreviewProvider {
    static var previews: some SwiftUI.View {
        
        let devices = [
            "iPhone 14 Pro Max",
            "iPhone 11"
        ]
        
        Group {
            ForEach(devices, id: \.self) { name in
                let vc = ViewController()
                UINavigationController(rootViewController: vc)
                    .preview
                    .edgesIgnoringSafeArea(.all)
                    .previewDevice(PreviewDevice(rawValue: name))
                    .previewDisplayName(name)
            }
        }
        
        
    }
}
