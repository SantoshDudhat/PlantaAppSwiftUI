//
//  PlantGuideListView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 05/12/24.
//

import SwiftUI

struct PlantGuideListView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let plants = [
        Plant(id: 1, imageName: "plant1", name: "Spider Plant", category: "Indoor", price: "$250", itemsLeft: 120, isPlant: true, orderStatus: "Order Successfully"),
        Plant(id: 2, imageName: "plant2", name: "Song of India", category: "Outdoor", price: "$250", itemsLeft: 140, isPlant: true, orderStatus: "Order Successfully"),
        Plant(id: 3, imageName: "plant2", name: "Anthurium", category: "Indoor", price: "$250", itemsLeft: 147, isPlant: true, orderStatus: "Order Successfully"),
        Plant(id: 4, imageName: "plant1", name: "Fiddle Leaf Fig", category: "Indoor", price: "$250", itemsLeft: 254, isPlant: true, orderStatus: "Order Successfully"),
        Plant(id: 5, imageName: "plant1", name: "Spider Plant", category: "Indoor", price: "$250", itemsLeft: 1277, isPlant: true, orderStatus: "Order Successfully"),
        Plant(id: 6, imageName: "plant2", name: "Song of India", category: "Outdoor", price: "$250", itemsLeft: 100, isPlant: true, orderStatus: "Order Successfully"),
        Plant(id: 7, imageName: "plant2", name: "Anthurium", category: "Indoor", price: "$250", itemsLeft: 1, isPlant: true, orderStatus: "Order Successfully"),
        Plant(id: 8, imageName: "plant1", name: "Fiddle Leaf Fig", category: "Indoor", price: "$250", itemsLeft: 787, isPlant: true, orderStatus: "Order Successfully"),
        Plant(id: 9, imageName: "plant1", name: "Spider Plant", category: "Indoor", price: "$250", itemsLeft: 170, isPlant: true, orderStatus: "Order Successfully"),
        Plant(id: 10, imageName: "plant2", name: "Song of India", category: "Outdoor", price: "$250", itemsLeft: 127, isPlant: true, orderStatus: "Order Successfully"),
        Plant(id: 11, imageName: "plant2", name: "Anthurium", category: "Indoor", price: "$250", itemsLeft: 150, isPlant: true, orderStatus: "Order Successfully"),
        Plant(id: 12, imageName: "plant1", name: "Fiddle Leaf Fig", category: "Indoor", price: "$250", itemsLeft: 241, isPlant: true, orderStatus: "Order Successfully")
    ]

    var body: some View {
        NavigationView {
            VStack(spacing: 4) {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("ic_back")
                    }
                    
                    Spacer()
                    
                    Text("PLANTING GUIDE")
                        .font(Font.custom(fontLatoBold, size: 16))
                        .foregroundColor(.black)
                        .padding(.trailing, 20)
                    Spacer()
                }
                .padding(.horizontal, 16)
                .frame(height: 44)
                .background(Color.white)
                
                List(plants, id: \.id) { item in
                    NavigationLink(destination: PlantGuideView(objSearch: item)) {
                        HStack {
                            Image(item.imageName)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .cornerRadius(8)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.name)
                                    .font(Font.custom(fontLatoRegular, size: 16))
                                    .padding(.bottom, 8)
                                
                                Text("Planting Guide")
                                    .font(Font.custom(fontLatoRegular, size: 16))
                                    .foregroundColor(subTitleGrayColor)
                            }
                            Spacer()
                        }
                        .padding(.vertical, 5)
                    }
                    .listRowSeparator(.hidden, edges: .all)
                }
                .scrollIndicators(.hidden)
                .padding(.top, 30)
                .padding(.leading, 18)
                .padding(.trailing, 18)
                .listStyle(PlainListStyle())
                
                Spacer()
            }
            .background(Color.white)
            .padding(.bottom, tabBarHeight)
            .ignoresSafeArea(.all, edges: .bottom)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    PlantGuideListView()
}
