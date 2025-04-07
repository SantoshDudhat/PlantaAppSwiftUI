//
//  SectionExpandableView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 05/12/24.
//

import SwiftUI

// MARK: - SectionType Enum
enum SectionType {
    case basicKnowledge
    case stages
}

struct SectionExpandableView<Content: View>: View {
    let title: String
    let isExpanded: Bool
    let toggleAction: () -> Void
    let content: Content

    init(
        title: String,
        isExpanded: Bool,
        toggleAction: @escaping () -> Void,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.isExpanded = isExpanded
        self.toggleAction = toggleAction
        self.content = content()
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .font(Font.customFont(fontLatoBold, size: 16))
                    .foregroundColor(.black)
                Spacer()
                Button(action: toggleAction) {
                    Image(isExpanded ? "ic_expend_minus" : "ic_expend_plus")
                        .foregroundColor(.gray)
                        .frame(width: 20, height: 20)
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 8)
            .background(Color.white)
            
            if isExpanded {
                VStack(alignment: .leading, spacing: 8) {
                    content
                }
                .padding(.top, 8)
            }
        }
        .padding(.horizontal, 8)
    }
}
