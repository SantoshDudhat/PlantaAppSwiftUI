//
//  Font+Extensions.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 02/12/24.
//

import Foundation
import SwiftUI

extension Font {
    /// Create a Font with a specific name and size
    static func customFont(_ name: String, size: CGFloat) -> Font {
        return Font.custom(name, size: size)
    }
}
