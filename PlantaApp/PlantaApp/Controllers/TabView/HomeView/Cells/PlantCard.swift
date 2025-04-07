//
//  PlantCard.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 02/12/24.
//

import SwiftUI

struct PlantCard: View {
    let imageName: String
    let name: String
    let category: String
    let price: String
    let isPlant: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Image(imageName)
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width/2 - 24, height: 134)
                .background(lightGrayBGColor)
                .cornerRadius(8)
            
            Text(name)
                .font(Font.custom(fontLatoRegular, size: 16))
                .foregroundColor(.black)
                .padding(.top, 6)
            
            if isPlant {
                Text(category)
                    .font(.caption)
                    .foregroundColor(subTitleGrayColor)
            }
            
            Text(price)
                .font(.subheadline)
                .foregroundColor(themeGreenColor)
        }
        .cornerRadius(10)
    }
}

#Preview {
    PlantCard(imageName: "plant1", name: "Lotus Amrela", category: "Indoor", price: "$150", isPlant: true)
}
