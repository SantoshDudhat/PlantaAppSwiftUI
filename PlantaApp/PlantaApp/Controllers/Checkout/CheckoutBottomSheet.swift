//
//  CheckoutBottomSheet.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 06/12/24.
//

import SwiftUI

struct CheckoutBottomSheet: View {
    @Binding var isVisible: Bool
    var onConfirm: () -> Void

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                // Title
                Text("Confirm Checkout?")
                    .font(Font.customFont(fontLatoBold, size: 16))
                    .foregroundColor(.black)
                
                // Confirmation Button
                Button(action: {
                    withAnimation {
                        isVisible = false
                    }
                    onConfirm()
                }) {
                    Text("YES")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .font(Font.customFont(fontLatoBold, size: 16))
                        .background(themeGreenColor)
                        .foregroundColor(.white)
                        .cornerRadius(4)
                }
                
                // Cancel Button
                Button(action: {
                    withAnimation {
                        isVisible = false
                    }
                }) {
                    Text("Cancel")
                        .foregroundColor(.black)
                        .underline(true, color: .black)
                }
            }
            .padding(.horizontal, 32)
//            .padding(.bottom, 60)
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -5)
                    .padding(.horizontal, 16)
//                    .padding(.bottom, 60)
            )
            .offset(y: isVisible ? 0 : UIScreen.main.bounds.height)
            .animation(.spring(), value: isVisible)
        }
    }
}
