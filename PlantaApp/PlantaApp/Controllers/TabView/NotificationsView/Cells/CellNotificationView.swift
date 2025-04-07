//
//  CellNotificationView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 03/12/24.
//

import SwiftUI

struct CellNotificationView: View {
    var item: Plant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image(item.imageName)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(item.orderStatus)
                        .font(Font.custom(fontLatoRegular, size: 16))
                        .foregroundColor(item.orderStatus == "Order Cancelled" ? .red : themeGreenColor)
                    HStack {
                        Text(item.name)
                            .font(Font.custom(fontLatoRegular, size: 16))
                            .foregroundColor(.black)
                        Text("|")
                            .font(Font.custom(fontLatoRegular, size: 16))
                            .foregroundColor(.black)
                        Text(item.category)
                            .font(Font.custom(fontLatoRegular, size: 16))
                            .foregroundColor(subTitleGrayColor)
                    }
                    Text("\(item.itemsLeft) items left")
                        .font(Font.custom(fontLatoRegular, size: 14))
                        .foregroundColor(.black)
                }
            }

            Spacer()
        }
    }
}

#Preview {
    CellNotificationView(item: Plant(id: 1, imageName: "plant2", name: "Spider Plant", category: "Indoor", price: "$241", itemsLeft: 241, isPlant: true, orderStatus: "Order Successfully"))
}
