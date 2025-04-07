//
//  CustomTabBar.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 02/12/24.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                Spacer()
                Button(action: {
                    selectedTab = tab
                }) {
                    VStack {
                        Image(tab.iconName)
                            .font(.system(size: 22))
                            .foregroundColor(selectedTab == tab ? .black : .gray)
                        if selectedTab == tab {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 6, height: 6)
                                .offset(y: -2)
                        }
                    }
                    .offset(y: iconOffSet)
                }
                Spacer()
            }
        }
        .padding(.vertical, 10)
        .frame(height: tabBarHeight) // Use dynamic height
        .background(Color.white)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: -1)
    }
        
    private var iconOffSet: CGFloat {
        let keyWindow = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
        
        let safeAreaInsets = keyWindow?.safeAreaInsets ?? .zero
        return safeAreaInsets.bottom > 0 ? -10 : 0
    }
}

enum Tab: CaseIterable {
    case home, search, notifications, profile
    
    var iconName: String {
        switch self {
        case .home: return "ic_home_tab"
        case .search: return "ic_search_tab"
        case .notifications: return "ic_notification_tab"
        case .profile: return "ic_profile_tab"
        }
    }
}
