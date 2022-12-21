//
//  Preview.swift
//  SnackBar
//
//  Created by Sai Kallepalli on 12/12/22.
//

import Foundation
import SwiftUI

extension UIView {
    private struct Preview: UIViewRepresentable {
        let view: UIView
        
        func makeUIView(context: Context) -> UIView {
            return view
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
    }
    
    public var preview: some View {
        return Preview(view: self)
    }
}

struct ViewPreviewer: PreviewProvider {
    static var previews: some View {
        let devices = [
            //            "iPhone 5S",
            "iPhone 11"
        ]
        //        let sizeCategories: [ContentSizeCategory] = [
        //            .extraSmall,
        //            .extraExtraExtraLarge,
        //            .accessibilityExtraExtraExtraLarge
        //        ]
        
        Group {
            ForEach(devices, id: \.self) { name in
                UIView()
                    .preview
                //                    .previewLayout(.sizeThatFits)
                    .previewDevice(PreviewDevice(rawValue: name))
                //                    .environment(\.sizeCategory, size)
                    .previewDisplayName(name)
            }
        }
    }
}

extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    }
    
    public var preview: some View {
        return Preview(viewController: self)
    }
}

struct Previewer: PreviewProvider {
    static var previews: some View {
        let devices = [
            "iPhone 5S",
            "iPhone 11"
        ]
        
        Group {
            ForEach(devices, id: \.self) { name in
                let vc = UIViewController()
                UINavigationController(rootViewController: vc)
                    .preview
                    .previewDevice(PreviewDevice(rawValue: name))
                    .previewDisplayName(name)
            }
        }
    }
}
