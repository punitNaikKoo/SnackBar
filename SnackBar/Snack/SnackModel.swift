//
//  SnackModel.swift
//  SnackBar
//
//  Created by Sai Kallepalli on 12/12/22.
//

import UIKit

//enum SnackUIType {
//    case invalid
//
//    case justImage(_ image: UIImage)
//    case justTitle(_ title: String)
//    case justSubtitle(_ subtitle: String)
//
//    case imageAndTitle(_ image: UIImage, _ title: String)
//    case imageAndSubtitle(_ image: UIImage, _ subtitle: String)
//
//    case titleAndSubtitle(_ title: String, _ subtitle: String)
//    case imageTitleAndSubtitle(_ image: UIImage, _ title: String, _ subtitle: String)
//}

struct SnackModel {
    var image: UIImage? = nil
    var title: String? = nil
    var subtitle: String? = nil
    var button: String? = nil
}

//extension SnackModel {
//    var uiType: SnackUIType {
//        switch (image == nil, title == nil, subtitle == nil) {
//            case (true, true, true):
//                return .invalid
//            case (false, true, true):
//                return .justImage(image!)
//            case (true, false, true):
//                return .justTitle(title!)
//            case (true, true, false):
//                return .justSubtitle(subtitle!)
//            case (false, false, true):
//                return .imageAndTitle(image!, title!)
//            case (false, true, false):
//                return .imageAndSubtitle(image!, subtitle!)
//            case (true, false, false):
//                return .titleAndSubtitle(title!, subtitle!)
//            case (false, false, false):
//                return .imageTitleAndSubtitle(image!, title!, subtitle!)
//        }
//    }
//}
