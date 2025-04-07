//
//  PlantDetailsView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 03/12/24.
//

import SwiftUI

struct PlantDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    let items = ["plant1", "plant2", "plant1"]
    let tags = ["Plant", "Indoor"]
    @State private var currentPage = 0
    var pickedItem = 0
    var price = 250
    var totalPrice = 0
    var objSearch: Plant
    @State private var isNavigating: Bool = false

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
                        
                        Text(objSearch.name)
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
                    
                    ZStack {
                        TabView {
                            ForEach(0..<items.count, id: \.self) { index in
                                PlantImageView(imageName: items[index])
                                    .tag(index)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.35)
                        .tabViewStyle(.page(indexDisplayMode: .automatic))
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 6) {
                            ForEach(tags, id: \.self) { tag in
                                Text(tag)
                                    .font(Font.customFont(fontLatoRegular, size: 14))
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 12)
                                    .background(themeGreenColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(4)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    .padding(.top, 15)
                    .padding(.leading, 30)
                    
                    HStack {
                        Text(objSearch.price)
                            .font(Font.custom(fontLatoRegular, size: 24))
                            .fontWeight(.medium)
                            .foregroundColor(themeGreenColor)
                        Spacer()
                    }
                    .padding(.top, 16)
                    .padding(.horizontal, 30)
                    
                    VStack {
                        VStack {
                            HStack {
                                Text("Details")
                                    .font(Font.custom(fontLatoRegular, size: 16))
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding(.bottom, 6)
                            .overlay(
                                Rectangle()
                                    .frame(height: 0.55)
                                    .padding(.bottom, -40)
                                    .foregroundColor(themeGrayColor),
                                alignment: .bottom
                            )
                            
                            HStack {
                                Text("Mass")
                                    .font(Font.custom(fontLatoRegular, size: 14))
                                    .foregroundColor(.black)
                                Spacer()
                                Text("1kg")
                                    .font(Font.custom(fontLatoRegular, size: 14))
                                    .foregroundColor(.black)
                            }
                            .padding(.top, 10)
                            .padding(.bottom, 6)
                            .overlay(
                                Rectangle()
                                    .frame(height: 0.55)
                                    .padding(.bottom, -40)
                                    .foregroundColor(themeGrayColor),
                                alignment: .bottom
                            )
                            
                            HStack {
                                Text("Origin")
                                    .font(Font.custom(fontLatoRegular, size: 14))
                                    .foregroundColor(.black)
                                Spacer()
                                Text("Africa")
                                    .font(Font.custom(fontLatoRegular, size: 14))
                                    .foregroundColor(.black)
                            }
                            .padding(.top, 10)
                            .padding(.bottom, 6)
                            .overlay(
                                Rectangle()
                                    .frame(height: 0.55)
                                    .padding(.bottom, -40)
                                    .foregroundColor(themeGrayColor),
                                alignment: .bottom
                            )
                            
                            HStack {
                                Text("Status")
                                    .font(Font.custom(fontLatoRegular, size: 14))
                                    .foregroundColor(.black)
                                Spacer()
                                Text("\(objSearch.itemsLeft) items left")
                                    .font(Font.custom(fontLatoRegular, size: 14))
                                    .foregroundColor(themeGreenColor)
                            }
                            .padding(.top, 10)
                            .padding(.bottom, 6)
                            .overlay(
                                Rectangle()
                                    .frame(height: 0.55)
                                    .padding(.bottom, -40)
                                    .foregroundColor(themeGrayColor),
                                alignment: .bottom
                            )
                        }
                        .padding(.top, 16)
                        .padding(.horizontal, 30)
                        
                        VStack {
                            HStack {
                                Text("You picked \(pickedItem) item")
                                    .font(Font.custom(fontLatoRegular, size: 14))
                                    .foregroundColor(subTitleGrayColor)
                                Spacer()
                                Text("Subtotal")
                                    .font(Font.custom(fontLatoRegular, size: 14))
                                    .foregroundColor(subTitleGrayColor)
                            }
                            .padding(.top, 10)
                            .padding(.bottom, 6)
                            
                            HStack {
                                HStack {
                                    Button(action: {
                                        // Minus action
                                    }) {
                                        Image("ic_minus")
                                            .foregroundColor(themeGrayColor)
                                    }
                                    
                                    Text("\(pickedItem)")
                                        .font(Font.custom(fontLatoRegular, size: 14))
                                        .foregroundColor(.black)
                                        .padding(.leading, 8)
                                        .padding(.trailing, 8)
                                    
                                    Button(action: {
                                        // Plus action
                                    }) {
                                        Image("ic_plus")
                                    }
                                    
                                }
                                Spacer()
                                Text("$\(totalPrice)")
                                    .font(Font.custom(fontLatoBold, size: 24))
                                    .foregroundColor(.black)
                            }
                            .padding(.bottom, 6)
                            
                            VStack {
                                Spacer()
                                
                                // Use padding to center and control width
                                Button(action: {
                                    // Button action
                                    print("Button tapped")
                                }) {
                                    Text("ADD TO CART")
                                        .font(Font.custom(fontLatoRegular, size: 16))
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity) // Ensure the button takes full available width
                                        .background(themeGrayColor)
                                        .cornerRadius(8)
                                }
                                Spacer()
                            }
                            .padding(.top, 4)
                        }
                        .padding(.top, 8)
                        .padding(.horizontal, 18)
                    }
                    Spacer()
                }
            }
            .scrollIndicators(.hidden)
            .background(Color.white)
            .padding(.bottom, tabBarHeight)
            .ignoresSafeArea(.all, edges: .bottom)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    PlantDetailsView(objSearch: Plant(id: 1, imageName: "plant2", name: "Spider Plant", category: "Indoor", price: "$149", itemsLeft: 241, isPlant: true, orderStatus: "Order Successfully"))
}
