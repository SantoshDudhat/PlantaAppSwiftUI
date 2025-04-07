//
//  HomeView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 02/12/24.
//

import SwiftUI

struct HomeView: View {
    
    let plants = [
        Plant(id: 1, imageName: "plant1", name: "Spider Plant", category: "Indoor", price: "$250", itemsLeft: 21, isPlant: true, orderStatus: "Order Successfully"),
        Plant(id: 2, imageName: "plant2", name: "Song of India", category: "Outdoor", price: "$250", itemsLeft: 1, isPlant: true, orderStatus: "Order Successfully"),
        Plant(id: 3, imageName: "plant2", name: "Anthurium", category: "Indoor", price: "$250", itemsLeft: 104, isPlant: true, orderStatus: "Order Successfully"),
        Plant(id: 4, imageName: "plant1", name: "Fiddle Leaf Fig", category: "Indoor", price: "$250", itemsLeft: 41, isPlant: true, orderStatus: "Order Successfully")
    ]
    
    let equipments = [
        Plant(id: 1, imageName: "equitment1", name: "White Planta Pots", category: "", price: "$250", itemsLeft: 1, isPlant: false, orderStatus: "Order Successfully"),
        Plant(id: 2, imageName: "equitment2", name: "Lemon Pots", category: "", price: "$200", itemsLeft: 75, isPlant: false, orderStatus: "Order Successfully"),
        Plant(id: 3, imageName: "equitment3", name: "Shovels", category: "", price: "$210", itemsLeft: 24, isPlant: false, orderStatus: "Order Successfully"),
        Plant(id: 4, imageName: "equitment2", name: "Finn Terrazzo", category: "", price: "$450", itemsLeft: 96, isPlant: false, orderStatus: "Order Successfully")
    ]

    @State private var isNavigatingPlant: Bool = false
    @State private var isNavigatingEquipment: Bool = false
    @State private var isNavigating: Bool = false
    

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 50) {
                    // Header Section
                    ZStack {
                        Image("img_new_arrival")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.34)
                            .clipped()
                        
                        VStack {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Planta - shining your little space")
                                        .font(Font.custom(fontLatoBold, size: 24))
                                        .foregroundColor(.black)
                                        .lineLimit(2)
                                        .fixedSize(horizontal: false, vertical: true)
                                    
                                    Button(action: {}) {
                                        HStack {
                                            Text("See New Arrivals")
                                                .foregroundColor(themeGreenColor)
                                                .font(Font.custom(fontLatoRegular, size: 16))
                                            Image(systemName: "arrow.right")
                                                .foregroundColor(themeGreenColor)
                                        }
                                    }
                                    .padding(.top, 4)
                                }
                                .padding()
                                
                                Spacer()
                                
                                Button(action: {
                                    isNavigating = true
                                }) {
                                    Image("ic_home_cart")
                                }
                                .navigationDestination(isPresented: $isNavigating, destination: {
                                    CartView()
                                })
                                .padding(.trailing)
                            }
                        }
                    }
                    
                    // Plants Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Plants")
                            .font(Font.custom(fontLatoRegular, size: 24))
                            .foregroundColor(.black)
                            .padding(.horizontal, 16)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(plants, id: \.name) { plant in
                                NavigationLink(destination: PlantDetailsView(objSearch: plant)) {
                                    PlantCard(imageName: plant.imageName,
                                              name: plant.name,
                                              category: plant.category,
                                              price: plant.price,
                                              isPlant: plant.isPlant)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    
                    // Equipments Section
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Equipments")
                                .font(Font.custom(fontLatoRegular, size: 24))
                                .foregroundColor(.black)
                                .padding(.horizontal, 16)
                            Spacer()
                            
                            Button(action: {
                                isNavigatingPlant = true
                            }) {
                                Text("See More")
                                    .font(Font.custom(fontLatoRegular, size: 16))
                                    .foregroundColor(.black)
                                    .underline(true, color: Color.black)
                                    .padding(.trailing, 16)
                            }
                            .navigationDestination(isPresented: $isNavigatingPlant, destination: {
                                PlantListView(isPlantList: true)
                            })
                            .padding(.top, -50)
                        }
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(equipments, id: \.name) { plant in
                                NavigationLink(destination: PlantDetailsView(objSearch: plant)) {
                                    PlantCard(imageName: plant.imageName,
                                              name: plant.name,
                                              category: plant.category,
                                              price: plant.price,
                                              isPlant: plant.isPlant)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    
                    // Planta Care Kit Section
                    VStack(alignment: .leading, spacing: 24) {
                        HStack {
                            Text("Planta Care Kit (new)")
                                .font(Font.custom(fontLatoRegular, size: 24))
                                .foregroundColor(.black)
                            Spacer()
                            
                            Button(action: {
                                isNavigatingEquipment = true
                            }) {
                                Text("See More")
                                    .font(Font.custom(fontLatoRegular, size: 16))
                                    .foregroundColor(.black)
                                    .underline(true, color: Color.black)
                            }
                            .navigationDestination(isPresented: $isNavigatingEquipment, destination: {
                                PlantListView(isPlantList: false)
                            })
                            .padding(.top, -50)
                        }
                        
                        HStack {
                            VStack {
                                VStack(alignment: .leading) {
                                    Text("Lemon Balm Grow Kit")
                                        .font(Font.customFont(fontLatoRegular, size: 16))
                                        .foregroundColor(.black)
                                        .lineLimit(1)
                                    Text("Include: Lemon Balm seeds, dung, Planta pot, marker...")
                                        .padding(.top, 1)
                                        .lineLimit(4)
                                        .font(Font.customFont(fontLatoRegular, size: 14))
                                        .foregroundColor(subTitleGrayColor)
                                }
                                .padding(.top, -10)
                                .padding(.leading, 16)
                            }
                            
                            Spacer()
                            
                            Image("lemon_balm")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 134)
                        }
                        .background(lightGrayBGColor)
                        .cornerRadius(8)
                    }
                    .frame(width: UIScreen.main.bounds.width - 32)
                    .padding(.horizontal)
                }
            }
            .scrollIndicators(.hidden)
            .padding(.bottom, tabBarHeight)
            .ignoresSafeArea()
            .background(Color.white)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    HomeView()
}
