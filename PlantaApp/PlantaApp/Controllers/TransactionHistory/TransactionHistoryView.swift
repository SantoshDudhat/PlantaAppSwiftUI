//
//  TransactionHistoryView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 05/12/24.
//

import SwiftUI

struct TransactionHistoryView: View {
    @Environment(\.presentationMode) var presentationMode
    var objPlant: Plant
    @State private var isNavigating: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack(spacing: 4) {
                        HStack {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Image("ic_back")
                            }
                            
                            Spacer()
                            
                            Text("TRANSACTION HISTORY")
                                .font(Font.custom(fontLatoBold, size: 16))
                                .foregroundColor(.black)
                                .padding(.trailing, 20)
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        .frame(height: 44)
                        .background(Color.white)
                        
                        HStack {
                            Text("\(objPlant.orderStatus)!!")
                                .font(Font.customFont(fontLatoRegular, size: 14))
                                .foregroundColor(themeGreenColor)
                                .padding(.top, 10)
                        }
                        
                        HStack {
                            Spacer()
                            Text("Personal Information")
                                .font(Font.custom(fontLatoBold, size: 16))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.horizontal, 40)
                        .padding(.bottom, 10)
                        .padding(.top, 30)
                        .overlay(
                            Rectangle()
                                .frame(height: 0.55)
                                .padding(.bottom, -40)
                                .padding(.horizontal, 40)
                                .foregroundColor(.black),
                            alignment: .bottom
                        )
                        
                        if let name = UserDefaults.standard.string(forKey: "$Name") {
                            HStack {
                                Text(name)
                                    .font(Font.customFont(fontLatoRegular, size: 14))
                                    .foregroundColor(subTitleGrayColor)
                                Spacer()
                            }
                            .padding(.top, 16)
                            .padding(.horizontal, 40)
                        }
                        
                        if let email = UserDefaults.standard.string(forKey: "$Email") {
                            HStack {
                                Text(email)
                                    .font(Font.customFont(fontLatoRegular, size: 14))
                                    .foregroundColor(subTitleGrayColor)
                                Spacer()
                            }
                            .padding(.top, 16)
                            .padding(.horizontal, 40)
                        }
                        
                        if let address = UserDefaults.standard.string(forKey: "$Address") {
                            HStack {
                                Text(address)
                                    .font(Font.customFont(fontLatoRegular, size: 14))
                                    .foregroundColor(subTitleGrayColor)
                                Spacer()
                            }
                            .padding(.top, 16)
                            .padding(.horizontal, 40)
                        }
                        
                        if let phone = UserDefaults.standard.string(forKey: "$Phone") {
                            HStack {
                                Text(phone)
                                    .font(Font.customFont(fontLatoRegular, size: 14))
                                    .foregroundColor(subTitleGrayColor)
                                Spacer()
                            }
                            .padding(.top, 16)
                            .padding(.horizontal, 40)
                        }
                        
                        HStack {
                            Spacer()
                            Text("Delivery Method")
                                .font(Font.custom(fontLatoBold, size: 16))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.horizontal, 40)
                        .padding(.bottom, 10)
                        .padding(.top, 40)
                        .overlay(
                            Rectangle()
                                .frame(height: 0.55)
                                .padding(.bottom, -40)
                                .padding(.horizontal, 40)
                                .foregroundColor(.black),
                            alignment: .bottom
                        )
                        
                        HStack {
                            Text("Quick Shipping - $15")
                                .font(Font.customFont(fontLatoRegular, size: 14))
                                .foregroundColor(subTitleGrayColor)
                            Spacer()
                        }
                        .padding(.top, 16)
                        .padding(.horizontal, 40)
                        
                        HStack {
                            Text("Expected Shipping Date:  May 5th")
                                .font(Font.customFont(fontLatoRegular, size: 14))
                                .foregroundColor(subTitleGrayColor)
                            Spacer()
                        }
                        .padding(.top, 16)
                        .padding(.horizontal, 40)
                        
                        HStack {
                            Spacer()
                            Text("Payment Method")
                                .font(Font.custom(fontLatoBold, size: 16))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.horizontal, 40)
                        .padding(.bottom, 10)
                        .padding(.top, 40)
                        .overlay(
                            Rectangle()
                                .frame(height: 0.55)
                                .padding(.bottom, -40)
                                .padding(.horizontal, 40)
                                .foregroundColor(.black),
                            alignment: .bottom
                        )
                        
                        HStack {
                            Text("VISA/MASTERCARD")
                                .font(Font.customFont(fontLatoRegular, size: 14))
                                .foregroundColor(subTitleGrayColor)
                            Spacer()
                        }
                        .padding(.top, 16)
                        .padding(.horizontal, 40)
                        
                        HStack {
                            Text("Your Item ")
                                .font(Font.custom(fontLatoBold, size: 16))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.horizontal, 40)
                        .padding(.bottom, 10)
                        .padding(.top, 40)
                        .overlay(
                            Rectangle()
                                .frame(height: 0.55)
                                .padding(.bottom, -40)
                                .padding(.horizontal, 40)
                                .foregroundColor(.black),
                            alignment: .bottom
                        )
                        
                        HStack {
                            CellNotificationView(item: objPlant)
                            Spacer()
                        }
                        .padding(.top, 24)
                        .padding(.horizontal, 40)
                        Spacer()
                    }
                }
                .scrollIndicators(.hidden)
                
                VStack {
                    HStack {
                        Text("You paid")
                            .font(Font.customFont(fontLatoRegular, size: 16))
                            .foregroundColor(.black)
                        Spacer()
                        Text("$515")
                            .font(Font.customFont(fontLatoRegular, size: 16))
                            .foregroundColor(.black)
                    }
                    
                    VStack {
                        Button(action: {
                            // Button action
                            print("Check out Planting Guide")
                            isNavigating = true
                        }) {
                            Text("Check out Planting Guide")
                                .font(Font.custom(fontLatoRegular, size: 16))
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(themeGreenColor)
                                .cornerRadius(4)
                        }
                        .navigationDestination(isPresented: $isNavigating) {
                            PlantGuideListView()
                        }
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Back to Homepage")
                                .font(Font.custom(fontLatoRegular, size: 16))
                                .foregroundColor(.black)
                                .overlay(alignment: .bottom) {
                                    Rectangle()
                                        .frame(height: 0.55)
                                        .foregroundColor(.black)
                                }
                        })
                        .padding(.top, 8)
                    }
                    .padding(.top, 4)
                }
                .padding(.top, 8)
                .padding(.bottom, 8)
                .padding(.horizontal, 40)
            }
            .background(Color.white)
            .padding(.bottom, tabBarHeight)
            .ignoresSafeArea(.all, edges: .bottom)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    TransactionHistoryView(objPlant: Plant(id: 1, imageName: "plant1", name: "Spider Plant", category: "Indoor", price: "$250", itemsLeft: 120, isPlant: true, orderStatus: "Order Successfully"))
}
