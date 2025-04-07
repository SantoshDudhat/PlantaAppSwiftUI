//
//  BottomSheet.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 05/12/24.
//

import SwiftUI

struct BottomSheet: View {
    @Binding var isVisible: Bool
    @Binding var cartItems: [Plant]
    
    var body: some View {
        VStack(spacing: 16) {
            // Title
            Text("Delete all orders?")
                .font(Font.customFont(fontLatoBold, size: 16))
                .foregroundColor(.black)

            // Subtitle
            Text("This cannot be undone")
                .font(.subheadline)
                .foregroundColor(.gray)

            // Confirmation Button
            Button(action: {
                cartItems.removeAll()
                withAnimation {
                    isVisible = false
                }
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
        .padding(.bottom, tabBarHeight)
        .frame(maxWidth: .infinity)
        .frame(height: 300)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -5)
                .padding(.horizontal, 16)
                .padding(.bottom, tabBarHeight)
        )
        .offset(y: isVisible ? 0 : UIScreen.main.bounds.height)
        .animation(.spring(), value: isVisible)
    }
}
