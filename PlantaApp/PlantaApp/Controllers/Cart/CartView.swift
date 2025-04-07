//
//  CartView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 04/12/24.
//

import SwiftUI

struct CartView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var plants = [
        Plant(id: 1, imageName: "plant1", name: "Money Plant", category: "Indoor", price: "$241", itemsLeft: 21, isPlant: true, orderStatus: "Order Successfully"),
    ]
    @State private var showBottomSheet = false
    @State private var isNavigating: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("ic_back")
                    }
                    
                    Spacer()
                    
                    Text("CART")
                        .font(Font.custom(fontLatoBold, size: 16))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        showBottomSheet = true
                    }) {
                        Image("ic_delete")
                    }
                }
                .padding()
                .background(Color.white)
                
                if plants.count > 0 {
                    List(plants, id: \.id) { item in
                        CellCart(item: item)
                            .listItemTint(.brown)
                            .listRowSeparator(.hidden, edges: .all)
                    }
                    .scrollIndicators(.hidden)
                    .padding(.top, 16)
                    .padding(.horizontal, 8)
                    .listStyle(PlainListStyle())
                    .background(.white)
                } else {
                    HStack {
                        Text("Your cart is currently empty.")
                            .font(Font.custom(fontLatoRegular, size: 14))
                    }
                }
                Spacer()
                
                if plants.count > 0 {
                    VStack {
                        HStack {
                            Text("Subtotal")
                                .font(Font.customFont(fontLatoRegular, size: 14))
                                .foregroundColor(subTitleGrayColor)
                            Spacer()
                            Text("$500")
                                .font(Font.customFont(fontLatoBold, size: 16))
                                .foregroundColor(.black)
                        }
                        
                        Button(action: {
                            isNavigating = true
                            print("Check out Planting Guide")
                        }) {
                            HStack {
                                Text("Proceed to Checkout")
                                    .font(Font.custom(fontLatoRegular, size: 16))
                                    .foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .tint(.white)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(themeGreenColor)
                            .cornerRadius(8)
                        }
                        .navigationDestination(isPresented: $isNavigating) {
                            CheckoutView()
                        }
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 8)
                }
            }
            .blur(radius: showBottomSheet ? 2 : 0)
            .disabled(showBottomSheet)
            .padding(.bottom, tabBarHeight)
            .ignoresSafeArea(.all, edges: .bottom)
            .navigationBarHidden(true)
        }

        // Bottom Sheet
        if showBottomSheet {
            BottomSheet(isVisible: $showBottomSheet, cartItems: $plants)
                .transition(.move(edge: .bottom))
        }
    }
}

#Preview {
    CartView()
}
