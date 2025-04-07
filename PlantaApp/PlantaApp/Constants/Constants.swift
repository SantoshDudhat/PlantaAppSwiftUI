//
//  Constants.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 02/12/24.
//

import Foundation
import UIKit

var safeAreInsets: UIEdgeInsets {
    let keyWindow = UIApplication.shared.connectedScenes
        .compactMap { $0 as? UIWindowScene }
        .flatMap { $0.windows }
        .first { $0.isKeyWindow }

    let safeAreaInsets = keyWindow?.safeAreaInsets ?? .zero
    return safeAreaInsets
}

var tabBarHeight: CGFloat {
    return safeAreInsets.bottom > 0 ? 83 : 49
}
