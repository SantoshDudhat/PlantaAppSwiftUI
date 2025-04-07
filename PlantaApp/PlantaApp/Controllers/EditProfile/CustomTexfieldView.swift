//
//  CustomTexfieldView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 04/12/24.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    @Binding var activeField: ActiveField?
    var field: ActiveField
    
    var body: some View {
        TextField(placeholder, text: $text, onEditingChanged: { isEditing in
            if isEditing {
                activeField = field
            } else {
                activeField = nil
            }
        })
        .font(Font.customFont(fontLatoRegular, size: 14))
        .foregroundColor(activeField == field ? .black : themeGrayColor)
        .padding(.vertical, 8)
        .background(Color.clear)
        .overlay(
            Rectangle()
                .frame(height: 0.55)
                .foregroundColor(activeField == field ? .black : themeGrayColor),
            alignment: .bottom
        )
        .keyboardType(keyboardType(for: field))
        .padding(.horizontal, 38)
        .padding(.top, 8)
    }
    
    private func keyboardType(for field: ActiveField) -> UIKeyboardType {
        switch field {
        case .email:
            return .emailAddress // Open email keyboard
        case .phone:
            return .phonePad // Open number pad for phone
        default:
            return .default // Default keyboard for other fields
        }
    }
}

enum BankActiveTextField: Hashable {
    case pin
    case cardName
    case expireDate
    case cvv
}

struct BankDetailsTextField: View {
    var placeholder: String
    @Binding var text: String
    @Binding var activeField: BankActiveTextField?
    var field: BankActiveTextField
    
    var body: some View {
        TextField(placeholder, text: $text, onEditingChanged: { isEditing in
            if isEditing {
                activeField = field
            } else {
                activeField = nil
            }
        })
        .font(Font.customFont(fontLatoRegular, size: 14))
        .foregroundColor(activeField == field ? .black : themeGrayColor)
        .padding(.vertical, 8)
        .background(Color.clear)
        .overlay(
            Rectangle()
                .frame(height: 0.55)
                .foregroundColor(activeField == field ? .black : themeGrayColor),
            alignment: .bottom
        )
        .keyboardType(keyboardType(for: field))
        .padding(.top, 8)
    }
    
    private func keyboardType(for field: BankActiveTextField) -> UIKeyboardType {
        switch field {
        case .pin, .cvv:
            return .numberPad
        case .expireDate:
            return .phonePad
        default:
            return .default
        }
    }
}
