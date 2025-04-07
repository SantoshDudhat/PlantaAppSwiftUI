//
//  ProfileView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 02/12/24.
//

import SwiftUI

enum ProfileNavigations: String {
    case editInformation = "Edit Information"
    case plantGuide = "Planting Guide"
    case transactionHistory = "Transaction History"
    case qAndA = "Q & A"
}

struct ProfileView: View {
    @State private var navigation: ProfileNavigations? = nil
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("PROFILE")
                            .font(Font.custom(fontLatoBold, size: 16))
                            .foregroundColor(.black)
                    }
                    
                    HStack(spacing: 16) {
                        Image("plant2")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                        
                        // Name and Email
                        VStack(alignment: .leading, spacing: 4) { // Vertical layout for text
                            if let name = UserDefaults.standard.string(forKey: "$Name") {
                                Text(name)
                                    .font(.system(size: 16, weight: .semibold)) // Name font
                                    .foregroundColor(.black)
                            } else {
                                Text("Planta App")
                                    .font(.system(size: 16, weight: .semibold)) // Name font
                                    .foregroundColor(.black)
                            }
                            
                            if let email = UserDefaults.standard.string(forKey: "$Email") {
                                Text(email)
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(.gray)
                            }
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 40)
                    .padding(.vertical, 30)
                    
                    HStack {
                        Text("General")
                            .font(Font.custom(fontLatoRegular, size: 16))
                            .foregroundColor(subTitleGrayColor)
                        Spacer()
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 10)
                    .padding(.top, 10)
                    .overlay(
                        Rectangle()
                            .frame(height: 0.55)
                            .padding(.bottom, -40)
                            .padding(.horizontal, 40)
                            .foregroundColor(subTitleGrayColor),
                        alignment: .bottom
                    )
                    
                    Button(action: {
                        navigation = .editInformation
                    }) {
                        HStack {
                            Text("Edit Information")
                                .font(Font.custom(fontLatoRegular, size: 16))
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }
                    .navigationDestination(isPresented: Binding(
                        get: { navigation == .editInformation },
                        set: { newValue in
                            if newValue {
                                navigation = .editInformation
                            } else {
                                navigation = nil
                            }
                        }
                    ), destination: {
                        EditProfileView()
                    })
                    .padding(.horizontal, 40)
                    .padding(.top, 12)
                    
                    Button(action: {
                        navigation = .plantGuide
                    }) {
                        HStack {
                            Text("Planting Guide")
                                .font(Font.custom(fontLatoRegular, size: 16))
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 12)
                    .navigationDestination(isPresented: Binding(
                        get: { navigation == .plantGuide },
                        set: { newValue in
                            if newValue {
                                navigation = .plantGuide
                            } else {
                                navigation = nil
                            }
                        }
                    )) {
                        PlantGuideListView()
                    }
                    
                    Button(action: {
                        navigation = .transactionHistory
                    }) {
                        HStack {
                            Text("Transaction History")
                                .font(Font.custom(fontLatoRegular, size: 16))
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }
                    .navigationDestination(isPresented: Binding(
                        get: { navigation == .transactionHistory },
                        set: { newValue in
                            if newValue {
                                navigation = .transactionHistory
                            } else {
                                navigation = nil
                            }
                        }
                    ), destination: {
                        TransactionListView()
                    })
                    .padding(.horizontal, 40)
                    .padding(.top, 12)
                    
                    
                    Button(action: {
                        navigation = .qAndA
                    }) {
                        HStack {
                            Text("Q & A")
                                .font(Font.custom(fontLatoRegular, size: 16))
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }
                    .navigationDestination(isPresented: Binding(
                        get: { navigation == .qAndA },
                        set: { newValue in
                            if newValue {
                                navigation = .qAndA
                            } else {
                                navigation = nil
                            }
                        }
                    ), destination: {
                        FAQView()
                    })
                    .padding(.horizontal, 40)
                    .padding(.top, 12)
                    
                    
                    HStack {
                        Text("Security")
                            .font(Font.custom(fontLatoRegular, size: 16))
                            .foregroundColor(subTitleGrayColor)
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
                            .foregroundColor(subTitleGrayColor),
                        alignment: .bottom
                    )
                    
                    HStack {
                        Text("Terms and Policy")
                            .font(Font.custom(fontLatoRegular, size: 16))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 12)
                    
                    HStack {
                        Text("Security Policy")
                            .font(Font.custom(fontLatoRegular, size: 16))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 12)
                    
                    Button(action: {
                        UserDefaults.standard.setValue(nil, forKey: "$Email")
                        UserDefaults.standard.setValue(nil, forKey: "$Name")
                        UserDefaults.standard.setValue(nil, forKey: "$Address")
                        UserDefaults.standard.setValue(nil, forKey: "$Phone")
                        isLoggedIn = false
                    }) {
                        HStack {
                            Text("Logout")
                                .font(Font.custom(fontLatoRegular, size: 16))
                                .foregroundColor(.red)
                            Spacer()
                        }
                        .padding(.horizontal, 40)
                        .padding(.top, 12)
                    }
                    Spacer()
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
    ProfileView()
}
