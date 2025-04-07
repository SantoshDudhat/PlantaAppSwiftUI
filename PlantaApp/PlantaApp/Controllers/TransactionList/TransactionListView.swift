//
//  TransactionListView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 05/12/24.
//

import SwiftUI

struct TransactionListView: View {
    @Environment(\.presentationMode) var presentationMode
    
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
        NavigationView {
            VStack(spacing: 4) {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("ic_back")
                    }
                    
                    Spacer()
                    
                    Text("TRANSACTION HISTORY")
                        .font(Font.custom(fontLatoBold, size: 16))
                        .foregroundColor(.black)
                        .padding(.trailing, 20)
                    Spacer()
                }
                .padding(.horizontal, 16)
                .frame(height: 44)
                .background(Color.white)
                
                List {
                    ForEach(sectionData, id: \.header) { section in
                        Section(header: NotificationSectionHeaderView(title: section.header)) {
                            ForEach(section.items, id: \.id) { item in
                                NavigationLink(destination: TransactionHistoryView(objPlant: item)) {
                                    CellNotificationView(item: item)
                                }
                            }
                        }
                    }
                    .listRowSeparator(.hidden, edges: .all)
                    
                }
                .listStyle(PlainListStyle())
                .background(Color.white)
                
                Spacer()
            }
            .background(Color.white)
            .padding(.bottom, tabBarHeight)
            .ignoresSafeArea(.all, edges: .bottom)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    TransactionListView()
}
