//
//  StepExpandableView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 05/12/24.
//

import SwiftUI

struct StepExpandableView: View {
    let step: String
    let description: String
    let isExpanded: Bool
    let toggleAction: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(step)
                    .font(Font.customFont(fontLatoRegular, size: 14))
                    .foregroundColor(.black)
                Spacer()
                Button(action: toggleAction) {
                    Image(isExpanded ? "faq_up_arrow" : "faq_down_arrow")
                        .frame(width: 20, height: 20)
                }
            }
            .padding(.vertical, 8)
            
            if isExpanded {
                Text(description)
                    .font(Font.customFont(fontLatoRegular, size: 14))
                    .foregroundColor(.black)
                    .padding(.top, 8)
                    .padding(.bottom, 16)
            }
        }
        .padding(.horizontal, 8)
        .background(Color.white)
    }
}
