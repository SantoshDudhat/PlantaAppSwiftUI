//
//  LoginView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 02/12/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @FocusState private var isTextFieldFocused: Bool
    @State private var hasImageBeenHidden: Bool = false
    @State private var emailError: String? = nil
    @State private var isNavigating: Bool = false
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack {
                        // Top Image
                        if !hasImageBeenHidden {
                            Image("img_login_plant")
                                .resizable()
                                .scaledToFill()
                                .frame(height: UIScreen.main.bounds.height * 0.45)
                                .clipped()
                        }
                        
                        // Title
                        Text("Planta")
                            .font(Font.customFont(fontLatoBlack, size: 36))
                            .foregroundColor(themeGreenColor)
                            .padding(.top, hasImageBeenHidden ? 50 : 20)
                        
                        // Subtitle
                        Text("Your Premier Destination for Lush Greenery:\nElevate your space with our exceptional plant\nselection")
                            .font(Font.customFont(fontLatoRegular, size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .padding(.horizontal, 30)
                            .padding(.top, 10)
                        
                        // TextField
                        VStack(alignment: .leading) {
                            TextField("Email", text: $email)
                                .focused($isTextFieldFocused)
                                .font(Font.customFont(fontLatoRegular, size: 16))
                                .padding(.vertical, 10)
                                .background(Color.clear)
                                .overlay(
                                    Rectangle()
                                        .frame(height: 1.5)
                                        .foregroundColor(hasImageBeenHidden ? Color.black : themeGrayColor)
                                        .padding(.top, 35),
                                    alignment: .bottom
                                )
                                .padding(.horizontal, 30)
                                .padding(.top, 20)
                                .onChange(of: isTextFieldFocused) { isFocused in
                                    if isFocused {
                                        hasImageBeenHidden = true
                                    }
                                }
                            
                            // Display error message if email is invalid
                            if let emailError = emailError {
                                Text(emailError)
                                    .font(Font.customFont(fontLatoBold, size: 14))
                                    .foregroundColor(.red)
                                    .padding(.top, 5)
                                    .padding(.horizontal, 30)
                            }
                        }
                        .padding(.bottom, 30)
                        
                        // Login/Register Button
                        Button(action: {
                            validateEmail()
                            
                            if emailError == nil {
                                isLoggedIn = true
                                UserDefaults.standard.setValue(email, forKey: "$Email")
                                isNavigating = true
                            } else {
                                print("Email validation failed")
                            }
                        }) {
                            Text("Login / Register")
                                .frame(maxWidth: .infinity)
                                .font(Font.customFont(fontLatoBold, size: 16))
                                .padding()
                                .background(hasImageBeenHidden ? Color.black : themeGrayColor)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .padding(.horizontal, 30)
                        }
                        .navigationDestination(isPresented: $isNavigating, destination: {
                            TabBarView()
                        })
                        .padding(.top, 16)
                        .disabled(!isTextFieldFocused)
                        
                        // Not Now Button
                        Button(action: {
                            isNavigating = true
                        }) {
                            Text("Not now")
                                .font(Font.customFont(fontLatoBold, size: 16))
                                .foregroundColor(.black)
                                .underline(true, color: .black)
                        }
                        .padding(.top, 10)
                        
                        Spacer()
                    }
                }
                .scrollIndicators(.hidden)
                .background(Color.white)
                .ignoresSafeArea()
                
                // Terms and Policy Text, shown after the image is hidden
                if hasImageBeenHidden {
                    VStack {
                        Text("By signing up, you will agree to our ")
                            .font(Font.customFont(fontLatoRegular, size: 14))
                            .foregroundColor(.black)
                        
                        HStack(spacing: 0) {
                            Text("Terms")
                                .font(Font.customFont(fontLatoRegular, size: 14))
                                .foregroundColor(themeGreenColor)
                                .underline(true, color: themeGreenColor)
                                .onTapGesture {
                                    // Handle the "Terms" tap
                                    print("Terms tapped")
                                }
                            
                            Text(" and ")
                                .font(Font.customFont(fontLatoRegular, size: 14))
                                .foregroundColor(.black)
                            
                            Text("Policy")
                                .font(Font.customFont(fontLatoRegular, size: 14))
                                .foregroundColor(themeGreenColor)
                                .underline(true, color: themeGreenColor)
                                .onTapGesture {
                                    // Handle the "Policy" tap
                                    print("Policy tapped")
                                }
                            
                            Text(".")
                                .font(Font.customFont(fontLatoRegular, size: 14))
                                .foregroundColor(.black)
                        }
                        .padding(.bottom, 20)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .padding(.horizontal, 30)
                }
            }
            .onTapGesture {
                isTextFieldFocused = false
            }
        }
    }
    
    private func validateEmail() {
        // Regular expression for email validation
        let emailPattern = "^[A-Za-z0-9+_.-]+@([A-Za-z0-9.-]+)\\.([a-z]{2,})$"
        let regex = try? NSRegularExpression(pattern: emailPattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: email.count)
        
        if let regex = regex, regex.firstMatch(in: email, options: [], range: range) == nil {
            emailError = "Invalid email format. Please try again."
        } else {
            emailError = nil
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
