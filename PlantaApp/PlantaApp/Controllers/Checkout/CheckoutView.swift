//
//  CheckoutView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 06/12/24.
//

import SwiftUI

enum DeliveryMethod {
    case none
    case quickShopping
    case cod
}

enum PaymentMethod {
    case none
    case masterCard
    case debitCard
    case cod
}

struct CheckoutView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = UserDefaults.standard.string(forKey: "$Name") ?? ""
    @State private var email: String = UserDefaults.standard.string(forKey: "$Email") ?? ""
    @State private var address: String = UserDefaults.standard.string(forKey: "$Address") ?? ""
    @State private var phone: String = UserDefaults.standard.string(forKey: "$Phone") ?? ""
    
    @State private var pin: String = ""
    @State private var cardName: String = ""
    @State private var expireDate: String = ""
    @State private var cvv: String = ""
    
    @State private var activeField: ActiveField? = nil
    @State private var bankField: BankActiveTextField? = nil
    
    @State private var selectedDelivery: DeliveryMethod = .cod
    @State private var paymentMethod: PaymentMethod = .cod
    
    @State private var showBottomSheet = false
    
    @State private var isNavigating = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 16) {
                    HStack(alignment: .center) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image("ic_back")
                        }
                        Text("CHECKOUT")
                            .font(Font.custom(fontLatoBold, size: 16))
                            .foregroundColor(.black)
                            .frame(width: UIScreen.main.bounds.width - 96)
                        Spacer()
                    }
                    .frame(height: 44)
                    .background(Color.white)
                    .padding(.horizontal, 16)
                    
                    ScrollView {
                        VStack {
                            if selectedDelivery == .quickShopping {
                                HStack {
                                    Text("Banking Information")
                                        .font(Font.custom(fontLatoBold, size: 16))
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                .padding(.horizontal, 40)
                                .padding(.bottom, 10)
                                .padding(.top, 16)
                                .overlay(
                                    Rectangle()
                                        .frame(height: 0.5)
                                        .padding(.bottom, -40)
                                        .padding(.horizontal, 40)
                                        .foregroundColor(.black),
                                    alignment: .bottom
                                )
                                
                                VStack {
                                    BankDetailsTextField(placeholder: "PIN", text: $pin, activeField: $bankField, field: .pin)
                                        .padding(.horizontal, 40)
                                    
                                    BankDetailsTextField(placeholder: "Card Name", text: $cardName, activeField: $bankField, field: .cardName)
                                        .padding(.horizontal, 40)
                                    
                                    BankDetailsTextField(placeholder: "Expired Date (MM/YY)", text: $expireDate, activeField: $bankField, field: .expireDate)
                                        .padding(.horizontal, 40)
                                    
                                    HStack {
                                        HStack {
                                            BankDetailsTextField(placeholder: "CVV", text: $cvv, activeField: $bankField, field: .cvv)
                                                .padding(.leading, 40)
                                                .frame(width: 200)
                                            Image(systemName: "info.circle")
                                                .foregroundColor(themeGrayColor)
                                        }
                                        Spacer()
                                    }
                                }
                            }
                            
                            HStack {
                                Text("Personal Information")
                                    .font(Font.custom(fontLatoBold, size: 16))
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding(.horizontal, 40)
                            .padding(.bottom, 10)
                            .padding(.top, 16)
                            .overlay(
                                Rectangle()
                                    .frame(height: 0.5)
                                    .padding(.bottom, -40)
                                    .padding(.horizontal, 40)
                                    .foregroundColor(.black),
                                alignment: .bottom
                            )
                            
                            VStack {
                                CustomTextField(placeholder: "Name", text: $name, activeField: $activeField, field: .name)
                                CustomTextField(placeholder: "Email", text: $email, activeField: $activeField, field: .email)
                                CustomTextField(placeholder: "Address", text: $address, activeField: $activeField, field: .address)
                                CustomTextField(placeholder: "Phone Number", text: $phone, activeField: $activeField, field: .phone)
                            }
                            
                            HStack {
                                Text("Delivery Method")
                                    .font(Font.custom(fontLatoBold, size: 16))
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding(.horizontal, 40)
                            .padding(.bottom, 10)
                            .padding(.top, 30)
                            .overlay(
                                Rectangle()
                                    .frame(height: 0.5)
                                    .padding(.bottom, -40)
                                    .padding(.horizontal, 40)
                                    .foregroundColor(.black),
                                alignment: .bottom
                            )
                            
                            VStack {
                                Button {
                                    selectedDelivery = .quickShopping
                                    paymentMethod = .masterCard
                                } label: {
                                    HStack {
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("Quick Shipping - $15")
                                                .font(Font.customFont(fontLatoRegular, size: 14))
                                                .foregroundColor(selectedDelivery == .quickShopping ? themeGreenColor : .black)
                                            Text("Expected Shipping Date:  May 5th")
                                                .font(Font.customFont(fontLatoRegular, size: 14))
                                                .foregroundColor(subTitleGrayColor)
                                        }
                                        Spacer()
                                        if selectedDelivery == .quickShopping {
                                            Image(systemName: "checkmark")
                                                .tint(themeGreenColor)
                                        }
                                    }
                                    .overlay(alignment: .top) {
                                        Rectangle()
                                            .frame(height: 0.5)
                                            .padding(.top, 45)
                                            .foregroundColor(themeGrayColor)
                                    }
                                }
                            }
                            .padding(.horizontal, 40)
                            .padding(.top, 10)
                            
                            VStack {
                                Button {
                                    selectedDelivery = .cod
                                    paymentMethod = .cod
                                } label: {
                                    HStack {
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("COD - $20")
                                                .font(Font.customFont(fontLatoRegular, size: 14))
                                                .foregroundColor(selectedDelivery == .cod ? themeGreenColor : .black)
                                            Text("Expected Shipping Date:  May 13th")
                                                .font(Font.customFont(fontLatoRegular, size: 14))
                                                .foregroundColor(subTitleGrayColor)
                                        }
                                        Spacer()
                                        if selectedDelivery == .cod {
                                            Image(systemName: "checkmark")
                                                .tint(themeGreenColor)
                                        }
                                    }
                                    .overlay(alignment: .top) {
                                        Rectangle()
                                            .frame(height: 0.5)
                                            .padding(.top, 45)
                                            .foregroundColor(themeGrayColor)
                                    }
                                }
                            }
                            .padding(.horizontal, 40)
                            .padding(.top, 10)
                            
                            HStack {
                                Text("Payment Method")
                                    .font(Font.custom(fontLatoBold, size: 16))
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding(.horizontal, 40)
                            .padding(.bottom, 10)
                            .padding(.top, 30)
                            .overlay(
                                Rectangle()
                                    .frame(height: 0.5)
                                    .padding(.bottom, -40)
                                    .padding(.horizontal, 40)
                                    .foregroundColor(.black),
                                alignment: .bottom
                            )
                            
                            if selectedDelivery == .quickShopping {
                                VStack {
                                    Button {
                                        paymentMethod = .masterCard
                                    } label: {
                                        HStack {
                                            VStack(alignment: .leading, spacing: 5) {
                                                Text("VISA/MASTERCARD")
                                                    .font(Font.customFont(fontLatoRegular, size: 14))
                                                    .foregroundColor(paymentMethod == .masterCard ? themeGreenColor : .black)
                                            }
                                            Spacer()
                                            if paymentMethod == .masterCard {
                                                Image(systemName: "checkmark")
                                                    .tint(themeGreenColor)
                                            }
                                        }
                                        .overlay(alignment: .top) {
                                            Rectangle()
                                                .frame(height: 0.5)
                                                .padding(.top, 30)
                                                .foregroundColor(themeGrayColor)
                                        }
                                    }
                                }
                                .padding(.horizontal, 40)
                                .padding(.top, 10)
                                
                                VStack {
                                    Button {
                                        paymentMethod = .debitCard
                                    } label: {
                                        HStack {
                                            VStack(alignment: .leading, spacing: 5) {
                                                Text("DEBIT CARD")
                                                    .font(Font.customFont(fontLatoRegular, size: 14))
                                                    .foregroundColor(paymentMethod == .debitCard ? themeGreenColor : .black)
                                            }
                                            Spacer()
                                            if paymentMethod == .debitCard {
                                                Image(systemName: "checkmark")
                                                    .tint(themeGreenColor)
                                            }
                                        }
                                        .overlay(alignment: .top) {
                                            Rectangle()
                                                .frame(height: 0.5)
                                                .padding(.top, 30)
                                                .foregroundColor(themeGrayColor)
                                        }
                                    }
                                }
                                .padding(.horizontal, 40)
                                .padding(.top, 20)
                            }
                            
                            if selectedDelivery == .cod {
                                VStack {
                                    Button {
                                        paymentMethod = .cod
                                    } label: {
                                        HStack {
                                            VStack(alignment: .leading, spacing: 5) {
                                                Text("COD")
                                                    .font(Font.customFont(fontLatoRegular, size: 14))
                                                    .foregroundColor(paymentMethod == .cod ? themeGreenColor : .black)
                                            }
                                            Spacer()
                                            if paymentMethod == .cod {
                                                Image(systemName: "checkmark")
                                                    .tint(themeGreenColor)
                                            }
                                        }
                                        .overlay(alignment: .top) {
                                            Rectangle()
                                                .frame(height: 0.5)
                                                .padding(.top, 30)
                                                .foregroundColor(themeGrayColor)
                                        }
                                    }
                                }
                                .padding(.horizontal, 40)
                                .padding(.top, 10)
                            }
                        }
                        .padding(.bottom, 16)
                    }
                    .scrollIndicators(.hidden)
                    
                    VStack(spacing: 4) {
                        HStack {
                            Text("Subtotal")
                                .foregroundColor(subTitleGrayColor)
                                .font(Font.customFont(fontLatoRegular, size: 14))
                            Spacer()
                            Text("$500")
                                .foregroundColor(.black)
                                .font(Font.customFont(fontLatoRegular, size: 14))
                        }
                        HStack {
                            Text("Subtotal")
                                .foregroundColor(subTitleGrayColor)
                                .font(Font.customFont(fontLatoRegular, size: 14))
                            Spacer()
                            Text("$15")
                                .foregroundColor(.black)
                                .font(Font.customFont(fontLatoRegular, size: 14))
                        }
                        HStack {
                            Text("Total")
                                .foregroundColor(subTitleGrayColor)
                                .font(Font.customFont(fontLatoBold, size: 16))
                            Spacer()
                            Text("$515")
                                .foregroundColor(themeGreenColor)
                                .font(Font.customFont(fontLatoBold, size: 16))
                        }
                        VStack {
                            Button(action: {
                                // Button action
                                print("CONTINUE")
                                showBottomSheet = true
                            }) {
                                Text("CONTINUE")
                                    .font(Font.custom(fontLatoRegular, size: 16))
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(themeGreenColor)
                                    .cornerRadius(8)
                            }
                            .padding(.vertical, 8)
                            
                            .navigationDestination(isPresented: $isNavigating) {
                                TransactionListView()
                            }
                        }
                        .overlay(
                            showBottomSheet ?
                            CheckoutBottomSheet(isVisible: $showBottomSheet, onConfirm: handleConfirm)
                            : nil
                        )
                    }
                    .padding(.horizontal, 24)
                }
            }
            .modifier(TapToDismissModifier())
            .blur(radius: showBottomSheet ? 2 : 0)
            .disabled(showBottomSheet)
            .padding(.bottom, showBottomSheet ? -335 : tabBarHeight)
            .ignoresSafeArea(.all, edges: .bottom)
        }
        .navigationBarHidden(true)
        if showBottomSheet {
            CheckoutBottomSheet(isVisible: $showBottomSheet, onConfirm: handleConfirm)
                .transition(.move(edge: .bottom))
        }
    }
    
    private func handleConfirm() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { // Wait for the bottom sheet to animate out
            isNavigating = true
        }
    }
}

#Preview {
    CheckoutView()
}
