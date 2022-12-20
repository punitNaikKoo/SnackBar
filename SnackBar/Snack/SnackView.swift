//
//  SnackView.swift
//  KooVoice
//
//  Created by Sai Kallepalli on 13/12/22.
//  Copyright © 2022 Bombinate Technologies Pvt Ltd. All rights reserved.
//

import UIKit
import EasyPeasy

struct SnackTheme {
    var imageTint: UIColor? = .black
    
    var titleColor: UIColor? = .black
    var titleFont: UIFont? = .systemFont(ofSize: 20, weight: .medium)
    
    var subtitleColor: UIColor? = .black
    var subtitleFont: UIFont? = .systemFont(ofSize: 14, weight: .light)
    
    var buttonTextColor: UIColor? = .black
    var buttonFont: UIFont? = .systemFont(ofSize: 20, weight: .medium)
    var buttonBgColor: UIColor? = .white
    
    var backgroundColor: UIColor? = .white.withAlphaComponent(0.9)
}

extension SnackTheme {
    static var post: SnackTheme {
        var theme = SnackTheme()
//        theme.backgroundColor = .blue
//        theme.titleFont = KooFont.userName
//        theme.titleColor = UIColor.textPrimary
        theme.buttonTextColor = .blue
//        theme.buttonFont = KooFont.handleName
        theme.buttonBgColor = .white.withAlphaComponent(0)
        return theme
    }
}

enum SnackStyle {
    case capsule
    case roundedEdges
}

class SnackView: BaseView {
    
    var isShowing: Bool = false
    var style: SnackStyle = .capsule
    var theme: SnackTheme = SnackTheme(){
        didSet {
            applyTheme()
        }
    }
    
    var didTapActionButton: (() -> ())?
    
    private let contentPadding: CGFloat = 20
    private let spacingBTWItems: CGFloat = 10
    private let titleSubtitleSpacing: CGFloat = 2
    
    private lazy var hStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        //        stack.backgroundColor = .red
        stack.distribution = .fillProportionally
        stack.spacing = spacingBTWItems
//        stack.backgroundColor = .red.withAlphaComponent(0.1)
        return stack
    }()
    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = titleSubtitleSpacing
//        stack.backgroundColor = .blue.withAlphaComponent(0.1)
        return stack
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.tintColor = theme.imageTint
//        view.backgroundColor = .red.withAlphaComponent(0.2)
        return view
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.textColor = theme.titleColor
        label.font = theme.titleFont
        return label
    }()
    
    private lazy var subtitle: UILabel = {
        let label = UILabel()
        label.text = "subtitle"
        label.textColor = theme.subtitleColor
        label.font = theme.subtitleFont
        return label
    }()
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.tintColor = theme.buttonTextColor
        button.setTitleColor(theme.buttonTextColor, for: .normal)
        button.titleLabel?.font = theme.buttonFont
        button.backgroundColor = theme.buttonBgColor
        button.layer.cornerRadius = 10
//        button.addTapGestureRecognizer { [weak self] in
//            self?.didTapActionButton?()
//        }
        return button
    }()
    
    override func commonInit() {
        backgroundColor = theme.backgroundColor
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
        
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.1
//        layer.shouldRasterize = true
//        layer.rasterizationScale = UIScreen.main.scale
        
        addSubview(hStack)
        hStack.easy.layout(Left(contentPadding), CenterY())
        hStack.addArrangedSubview(imageView)
        imageView.easy.layout(Width(30), Height(>=20).with(.medium))
        hStack.addArrangedSubview(vStack)
        
        vStack.addArrangedSubview(title)
        vStack.addArrangedSubview(subtitle)
        
        addSubview(actionButton)
        let width = actionButton.intrinsicContentSize.width + 15
        actionButton.easy.layout(CenterY(), Right(contentPadding), Width(width))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        switch style {
            case .capsule:
                layer.cornerRadius = frame.height/2
            case .roundedEdges:
                layer.cornerRadius = 6
        }
    }
    
    private func applyTheme() {
        backgroundColor = theme.backgroundColor
        
        imageView.tintColor = theme.imageTint
        title.textColor = theme.titleColor
        title.font = theme.titleFont
        
        subtitle.textColor = theme.subtitleColor
        subtitle.font = theme.subtitleFont
        
        actionButton.tintColor = theme.buttonTextColor
        actionButton.setTitleColor(theme.buttonTextColor, for: .normal)
        actionButton.titleLabel?.font = theme.buttonFont
        actionButton.backgroundColor = theme.buttonBgColor
    }
}

extension SnackView {
    func update(_ model: SnackModel) {
        if let image = model.image {
            imageView.image = image
            imageView.isHidden = false
        } else {
            imageView.image = nil
            imageView.isHidden = true
        }
        
        if let titleText = model.title {
            title.text = titleText
            title.isHidden = false
            if model.image == nil {
                title.textAlignment = .center
            } else {
                title.textAlignment = .left
            }
        } else {
            title.text = ""
            title.isHidden = true
        }
        
        if let subtitleText = model.subtitle {
            subtitle.text = subtitleText
            subtitle.isHidden = false
            if model.image == nil {
                subtitle.textAlignment = .center
            } else {
                subtitle.textAlignment = .left
            }
        } else {
            subtitle.text = ""
            subtitle.isHidden = true
        }
        
        if let buttonText = model.button {
            actionButton.setTitle(buttonText, for: .normal)
            actionButton.isHidden = false
            let width = actionButton.intrinsicContentSize.width + 15
            actionButton.easy.layout(
                Left(spacingBTWItems).to(hStack, .right),
                CenterY(),
                Right(20),
                Width(width)
            )
        } else {
            actionButton.setTitle("", for: .normal)
            actionButton.isHidden = true
            actionButton.easy.layout(
                Left(0).to(hStack, .right),
                CenterY(),
                Right(contentPadding),
                Width(0)
            )
        }
        
    }
}

import SwiftUI

@available(iOS 13.0.0, *)
struct SnackViewPreviewer: PreviewProvider {
    static var previews: some SwiftUI.View {
        SnackView()
            .preview
            .frame(width: 300, height: 80)
    }
}
