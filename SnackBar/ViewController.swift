//
//  ViewController.swift
//  SnackBar
//
//  Created by Sai Kallepalli on 12/12/22.
//

import UIKit
import EasyPeasy

class ViewController: UIViewController {
    
    struct Constants {
        static let buttonHeight: CGFloat = 60
    }

    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = UIColor(red: 0.973, green: 0.969, blue: 0.953, alpha: 1)
        
        let titleModel = SnackModel(title: "one")
        let title = SnackView()
        title.update(titleModel)
        view.addSubview(title)
        title.easy.layout(Top(24).to(view, .topMargin),
                          Left(24),
                          Right(24),
                          Height(Constants.buttonHeight))
        
        let subtitleModel = SnackModel(subtitle: "Two")
        let subtitle = SnackView()
        subtitle.update(subtitleModel)
        view.addSubview(subtitle)
        subtitle.easy.layout(Left().to(title, .leftMargin),
                             Top(20).to(title, .bottom),
                             Height().like(title),
                             Width().like(title))
        
        let subtitleModel2 = SnackModel(title: "three", subtitle: "Four")
        let subtitle2 = SnackView()
        subtitle2.update(subtitleModel2)
        view.addSubview(subtitle2)
        subtitle2.easy.layout(Left().to(title, .leftMargin),
                              Top(20).to(subtitle, .bottom),
                              Height().like(title),
                              Width().like(title))
        
        let subtitleModel3 = SnackModel(image: .pencil, title: "five", subtitle: "six")
        let subtitle3 = SnackView()
        subtitle3.update(subtitleModel3)
        view.addSubview(subtitle3)
        subtitle3.easy.layout(Left().to(title, .leftMargin),
                              Top(20).to(subtitle2, .bottom),
                              Height().like(title),
                              Width().like(title))
        
        let subtitleModel4 = SnackModel(image: .pencil, title: "seven", subtitle: "eight", button: "View")
        let subtitle4 = SnackView()
        subtitle3.update(subtitleModel4)
        view.addSubview(subtitle4)
        subtitle4.easy.layout(Left().to(title, .leftMargin),
                              Top(20).to(subtitle3, .bottom),
                              Height().like(title),
                              Width().like(title))
        
        showAction(UIButton())
        
        let horizontalStack  =  UIStackView()
        horizontalStack.axis = .horizontal
        view.addSubview(horizontalStack)
        horizontalStack.easy.layout(Bottom(50).to(view,.bottomMargin),
                                    Left(0),
                                    Right(0),
                                    Height(60))
        
        let showButton = UIButton()
        showButton.setTitle("Show", for: .normal)
        showButton.setTitleColor(.blue, for: .normal)
        showButton.addTarget(self, action: #selector(showAction(_:)), for: .touchUpInside)
        horizontalStack.addArrangedSubview(showButton)
        showButton.easy.layout( Width(100))

        let hideButton = UIButton()
        hideButton.setTitle("Hide", for: .normal)
        hideButton.setTitleColor(.blue, for: .normal)
        hideButton.addTarget(self, action: #selector(hideAction(_:)), for: .touchUpInside)
        horizontalStack.addArrangedSubview(hideButton)
        showButton.easy.layout( Width(100))
    }
    
    @objc func showAction(_ sender: UIButton) {
        let model = SnackModel(title: "Action Button")
        SnackBar.shared.show(model: model)
    }
    
    @objc func hideAction(_ sender: UIButton) {
        SnackBar.shared.hide()
    }
}

import SwiftUI

struct ViewControllerPreview: PreviewProvider {
    static var previews: some SwiftUI.View {
        let vc = ViewController()
        UINavigationController(rootViewController: vc)
            .preview
    }
}
