//
//  UtilityFunctions.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 02/12/24.
//

import Foundation
import SwiftUI

struct CustomCornerRadiusShape: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
