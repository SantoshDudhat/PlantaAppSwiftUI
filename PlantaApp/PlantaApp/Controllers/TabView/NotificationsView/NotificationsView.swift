//
//  NotificationsView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 02/12/24.
//

import SwiftUI

struct NotificationsView: View {
    
    let sectionData: [(header: String, items: [Plant])] = [
        ("Wednesday, April 30th", [Plant(id: 1, imageName: "plant1", name: "Spider Plant", category: "Indoor", price: "$250", itemsLeft: 120, isPlant: true, orderStatus: "Order Successfully")]),
        ("Monday, May 25th", [Plant(id: 2, imageName: "plant2", name: "Song of India", category: "Outdoor", price: "$250", itemsLeft: 140, isPlant: true, orderStatus: "Order Cancelled"),
                              Plant(id: 3, imageName: "plant2", name: "Anthurium", category: "Indoor", price: "$250", itemsLeft: 147, isPlant: true, orderStatus: "Order Successfully"),
                              Plant(id: 4, imageName: "plant1", name: "Fiddle Leaf Fig", category: "Indoor", price: "$250", itemsLeft: 254, isPlant: true, orderStatus: "Order Successfully")]),
        ("Friday, July 1st", [Plant(id: 5, imageName: "plant1", name: "Spider Plant", category: "Indoor", price: "$250", itemsLeft: 1277, isPlant: true, orderStatus: "Order Cancelled")]),
        ("Monday, November 18th", [Plant(id: 6, imageName: "plant2", name: "Song of India", category: "Outdoor", price: "$250", itemsLeft: 100, isPlant: true, orderStatus: "Order Successfully"),
                                   Plant(id: 12, imageName: "plant1", name: "Fiddle Leaf Fig", category: "Indoor", price: "$250", itemsLeft: 241, isPlant: true, orderStatus: "Order Cancelled")])
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack(alignment: .center) {
                Button(action: {
                    // Action for back button
                }) {
                    Image("ic_back")
                }
                .padding(10)
                Text("NOTIFICATION")
                    .font(Font.custom(fontLatoBold, size: 16))
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width - 96)
                Spacer()
            }
            .frame(height: 44)
            .background(Color.white)
            
            List {
                ForEach(sectionData, id: \.header) { section in
                    Section(header: NotificationSectionHeaderView(title: section.header)) {
                            ForEach(section.items, id: \.id) { item in
                                CellNotificationView(item: item)
                            }
                        }
                }
                .listRowSeparator(.hidden, edges: .all)

            }
            .padding(.top, 30)
            .listStyle(PlainListStyle())
            .background(Color.white)
            Spacer()
        }
        .padding(.bottom, tabBarHeight)
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    NotificationsView()
}
