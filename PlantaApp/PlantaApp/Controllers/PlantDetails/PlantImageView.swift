//
//  PlantImageView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 03/12/24.
//

import SwiftUI

struct PlantImageView: View {
    let imageName: String
    
    var body: some View {
        VStack(spacing: 20) {
            Image(imageName)
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.35)
                .foregroundColor(.teal)
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    PlantImageView(imageName: "plant2")
}
