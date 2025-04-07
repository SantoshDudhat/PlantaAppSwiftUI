//
//  TabBarView.swift.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 02/12/24.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        ZStack {
            // Main content based on the selected tab
            switch selectedTab {
            case .home:
                HomeView()
            case .search:
                SearchView()
            case .notifications:
                NotificationsView()
            case .profile:
                ProfileView()
            }
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    TabBarView()
}
