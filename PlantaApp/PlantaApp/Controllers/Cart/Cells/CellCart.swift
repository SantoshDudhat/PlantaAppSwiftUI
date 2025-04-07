//
//  CellCart.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 05/12/24.
//

import SwiftUI

struct CellCart: View {
    var item: Plant
    @State private var isChecked: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Button {
                    isChecked.toggle()
                } label: {
                    Image(isChecked ? "ic_checked" : "ic_uncheck")
                        .resizable()
                        .tint(.black)
                        .frame(width: 24, height: 24)
                }
                .padding(.trailing, 16)
                
                Image(item.imageName)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
                    .padding(.trailing, 8)
                
                VStack(alignment: .leading, spacing: 6) {
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
                    
                    Text(item.price)
                        .font(Font.custom(fontLatoRegular, size: 16))
                        .foregroundColor(themeGreenColor)
                    
                    HStack {
                        Button {
                            // minus
                        } label: {
                            Image("ic_minus")
                                .resizable()
                                .tint(.black)
                                .frame(width: 24, height: 24)
                        }
                        
                        Text("2")
                            .padding(.leading, 8)
                            .padding(.trailing, 8)
                        
                        Button {
                            // plus
                        } label: {
                            Image("ic_plus")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                        
                        Button {
                            // plus
                        } label: {
                            Text("Remove")
                                .font(Font.custom(fontLatoRegular, size: 16))
                                .foregroundColor(.black)
                                .underline(true, color: Color.black)
                        }
                        .padding(.leading, 16)
                    }
                }
            }

            Spacer()
        }
    }
}

#Preview {
    CellCart(item: Plant(id: 1, imageName: "plant2", name: "Spider Plant", category: "Indoor", price: "$241", itemsLeft: 241, isPlant: true, orderStatus: "Order Successfully"))
}
