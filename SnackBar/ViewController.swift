//
//  ViewController.swift
//  SnackBar
//
//  Created by Sai Kallepalli on 12/12/22.
//

import UIKit
import EasyPeasy

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = UIColor(red: 0.973, green: 0.969, blue: 0.953, alpha: 1)
        
        let titleModel = SnackModel(title: "Title")
        let title = SnackView()
        title.update(titleModel)
        view.addSubview(title)
        title.easy.layout(Top(200).to(view, .topMargin), Left(20), Right(20), Height(60))
        
        let subtitleModel = SnackModel(subtitle: "Subtitle")
        let subtitle = SnackView()
        subtitle.update(subtitleModel)
        view.addSubview(subtitle)
        subtitle.easy.layout(Top(20).to(title, .bottom), Left(20), Right(20), Height(60))
        
        let subtitleModel2 = SnackModel(title: "Title", subtitle: "Subtitle")
        let subtitle2 = SnackView()
        subtitle2.update(subtitleModel2)
        view.addSubview(subtitle2)
        subtitle2.easy.layout(Top(20).to(subtitle, .bottom), Left(20), Right(20), Height(60))
        
        let subtitleModel3 = SnackModel(image: .pencil, title: "Title", subtitle: "Subtitle")
        let subtitle3 = SnackView()
        subtitle3.update(subtitleModel3)
        view.addSubview(subtitle3)
        subtitle3.easy.layout(Top(20).to(subtitle2, .bottom), Left(20), Right(20), Height(60))
        
        let subtitleModel4 = SnackModel(image: .pencil, title: "Title", subtitle: "Subtitle", button: "View")
        let subtitle4 = SnackView()
        subtitle3.update(subtitleModel4)
        view.addSubview(subtitle4)
        subtitle4.easy.layout(Top(20).to(subtitle3, .bottom), Left(20), Right(20), Height(60))
        
        showAction(UIButton())

        let showButton = UIButton()
        showButton.setTitle("Show", for: .normal)
        showButton.setTitleColor(.blue, for: .normal)
        showButton.addTarget(self, action: #selector(showAction(_:)), for: .touchUpInside)
        view.addSubview(showButton)
        showButton.easy.layout(
            Top(50).to(view, .topMargin),
            CenterX()
        )

        let hideButton = UIButton()
        hideButton.setTitle("Hide", for: .normal)
        hideButton.setTitleColor(.blue, for: .normal)
        hideButton.addTarget(self, action: #selector(hideAction(_:)), for: .touchUpInside)
        view.addSubview(hideButton)
        hideButton.easy.layout(
            Top(50).to(showButton, .bottom),
            CenterX()
        )
    }
    
    @objc func showAction(_ sender: UIButton) {
        let model = SnackModel(title: "Title")
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
