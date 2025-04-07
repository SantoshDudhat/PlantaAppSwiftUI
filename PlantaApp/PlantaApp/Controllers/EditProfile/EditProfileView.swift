//
//  EditProfileView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 04/12/24.
//

import SwiftUI

enum ActiveField: Hashable {
    case name
    case email
    case address
    case phone
}

struct EditProfileView: View {
    @State private var name: String = UserDefaults.standard.string(forKey: "$Name") ?? ""
    @State private var email: String = UserDefaults.standard.string(forKey: "$Email") ?? ""
    @State private var address: String = UserDefaults.standard.string(forKey: "$Address") ?? ""
    @State private var phone: String = UserDefaults.standard.string(forKey: "$Phone") ?? ""
    
    @State private var activeField: ActiveField? = nil
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image("ic_back")
                }
                .padding(10)
                Text("EDIT INFORMATION")
                    .font(Font.custom(fontLatoBold, size: 16))
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width - 96)
                Spacer()
            }
            .frame(height: 44)
            .background(Color.white)
            
            HStack {
                Text("The information will be saved for the next purchase. Click on the details to edit.")
                    .font(Font.custom(fontLatoRegular, size: 14))
                    .foregroundColor(.black)
            }
            .padding(.top, 30)
            .padding(.horizontal, 38)
            
            VStack {
                CustomTextField(placeholder: "Name", text: $name, activeField: $activeField, field: .name)
                CustomTextField(placeholder: "Email", text: $email, activeField: $activeField, field: .email)
                CustomTextField(placeholder: "Address", text: $address, activeField: $activeField, field: .address)
                CustomTextField(placeholder: "Phone Number", text: $phone, activeField: $activeField, field: .phone)
            }
            .padding(.top, 40)

            Spacer()
            
            Button(action: {
                UserDefaults.standard.setValue(email, forKey: "$Email")
                UserDefaults.standard.setValue(name, forKey: "$Name")
                UserDefaults.standard.setValue(address, forKey: "$Address")
                UserDefaults.standard.setValue(phone, forKey: "$Phone")
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("SAVE")
                    .font(Font.custom(fontLatoRegular, size: 16))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity) // Full width button
                    .background(themeGreenColor)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 24)
        }
        .padding(.bottom, tabBarHeight)
        .ignoresSafeArea(.all, edges: .bottom)
        .navigationBarHidden(true)
        .modifier(TapToDismissModifier())
    }
}

#Preview {
    EditProfileView()
}
