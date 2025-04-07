//
//  SplashScreenView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 04/12/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var fadeOut = false // For fade-out animation
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false

    var body: some View {
        ZStack {
            if isActive {
                if isLoggedIn {
                    TabBarView()
                } else {
                    LoginView()
                }
            } else {
                VStack {
                    Image("img_app_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .animation(.easeInOut(duration: 1), value: fadeOut)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .ignoresSafeArea()
                .onAppear {
                    withAnimation {
                        fadeOut = true
                    }
                    
                    // Delay before navigating to the main content
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .animation(.easeInOut(duration: 1), value: isActive) // Smooth transition
    }
}

struct ContentView: View {
    var body: some View {
        SplashScreenView()
    }
}

#Preview {
    SplashScreenView()
}
