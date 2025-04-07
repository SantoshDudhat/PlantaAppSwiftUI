//
//  NotificationSectionHeaderView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 03/12/24.
//

import SwiftUI

struct NotificationSectionHeaderView: View {
    var title: String

    var body: some View {
        HStack {
            Text(title)
                .font(Font.custom(fontLatoBold, size: 16))
                .foregroundColor(.black)
                .padding(.vertical, 10)
            Spacer()
        }
        .overlay(
            Rectangle()
                .frame(height: 0.55)
                .padding(.bottom, -40)
                .foregroundColor(themeGrayColor),
            alignment: .bottom
        )
//        .padding(.horizontal)
    }
}

#Preview {
    NotificationSectionHeaderView(title: "Hello, !!!")
}
