//
//  PlantListView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 03/12/24.
//

import SwiftUI

enum CategorySelection : String, CaseIterable {
    case all = "All"
    case new = "New"
    case outdoor = "Outdoor"
    case indoor = "Indoor"
}


struct PlantListView: View {
    @State var selectedSegment = 0
    @Environment(\.presentationMode) var presentationMode
    @State private var isNavigating: Bool = false

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
    
    let equipments = [
        Plant(id: 1, imageName: "equitment1", name: "White Planta Pots", category: "", price: "$250", itemsLeft: 241, isPlant: false, orderStatus: "Order Successfully"),
        Plant(id: 2, imageName: "equitment2", name: "Lemon Pots", category: "", price: "$200", itemsLeft: 2421, isPlant: false, orderStatus: "Order Successfully"),
        Plant(id: 3, imageName: "equitment3", name: "Shovels", category: "", price: "$210", itemsLeft: 2414, isPlant: false, orderStatus: "Order Successfully"),
        Plant(id: 4, imageName: "equitment2", name: "Finn Terrazzo", category: "", price: "$450", itemsLeft: 3341, isPlant: false, orderStatus: "Order Successfully"),
        Plant(id: 5, imageName: "equitment1", name: "Spider Plant", category: "Indoor", price: "$250", itemsLeft: 421, isPlant: false, orderStatus: "Order Successfully"),
        Plant(id: 6, imageName: "equitment2", name: "Song of India", category: "Outdoor", price: "$250", itemsLeft: 2431, isPlant: false, orderStatus: "Order Successfully"),
        Plant(id: 7, imageName: "equitment1", name: "Anthurium", category: "Indoor", price: "$250", itemsLeft: 41, isPlant: false, orderStatus: "Order Successfully"),
        Plant(id: 8, imageName: "equitment3", name: "Fiddle Leaf Fig", category: "Indoor", price: "$250", itemsLeft: 1, isPlant: false, orderStatus: "Order Successfully"),
        Plant(id: 9, imageName: "equitment1", name: "Spider Plant", category: "Indoor", price: "$250", itemsLeft: 4, isPlant: false, orderStatus: "Order Successfully"),
        Plant(id: 10, imageName: "equitment3", name: "Song of India", category: "Outdoor", price: "$250", itemsLeft: 2, isPlant: false, orderStatus: "Order Successfully"),
        Plant(id: 11, imageName: "equitment2", name: "Anthurium", category: "Indoor", price: "$250", itemsLeft: 50, isPlant: false, orderStatus: "Order Successfully"),
        Plant(id: 12, imageName: "equitment1", name: "Fiddle Leaf Fig", category: "Indoor", price: "$250", itemsLeft: 144, isPlant: false, orderStatus: "Order Successfully")

    ]

    var isPlantList: Bool
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 4) {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image("ic_back")
                        }
                        
                        Spacer()
                        
                        Text(isPlantList ? "PLANTS" : "EQUIPMENTS")
                            .font(Font.custom(fontLatoBold, size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Button(action: {
                            isNavigating = true
                        }) {
                            Image("ic_shopping_cart")
                        }
                        .navigationDestination(isPresented: $isNavigating) {
                            CartView()
                        }
                    }
                    .padding()
                    .background(Color.white)
                    
                    CustomSegmentedControl(
                        selectedSegment: $selectedSegment,
                        segments: CategorySelection.allCases, selectedIndex: { index in
                            print(index.rawValue)
                        }
                    )
                    .padding(.vertical, 16)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(isPlantList ? plants : equipments, id: \.id) { plant in
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
            }
            .scrollIndicators(.hidden)
            .padding(.bottom, tabBarHeight)
            .ignoresSafeArea(.all, edges: .bottom)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    PlantListView(isPlantList: true)
}


struct CustomSegmentedControl: View {
    @Binding var selectedSegment: Int
    let segments: [CategorySelection]
    let selectedIndex: (CategorySelection)->Void
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<segments.count, id: \.self) { index in
                Text(segments[index].rawValue)
                    .font(Font.customFont(fontLatoRegular, size: 14))
                    .foregroundColor(selectedSegment == index ? .white : .black)
                    .frame(maxWidth: .infinity, minHeight: 40) // Adjust the height here
                    .background(selectedSegment == index ? themeGreenColor : .clear)
                    .cornerRadius(4)
                    .onTapGesture {
                        withAnimation {
                            selectedSegment = index
                            selectedIndex(segments[index])
                        }
                    }
            }
        }
        .padding(.horizontal, 16)
    }
}
