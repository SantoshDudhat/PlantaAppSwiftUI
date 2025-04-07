//
//  SearchView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 02/12/24.
//

import SwiftUI
import Combine

struct SearchView: View {
    @State private var searchText: String = ""
    @State private var recentSearches = ["Spider Plant", "Song of India"]
    @State private var arrSearch: [Plant] = [
        Plant(id: 1, imageName: "plant1", name: "Spider Plant", category: "Indoor", price: "$250", itemsLeft: 21, isPlant: true, orderStatus: "Order Successfully"),
        Plant(id: 2, imageName: "plant2", name: "Sonf", category: "Outdoor", price: "$210", itemsLeft: 1, isPlant: true, orderStatus: "Order Successfully"),
        Plant(id: 3, imageName: "plant2", name: "Money Plant", category: "Indoor", price: "$150", itemsLeft: 104, isPlant: true, orderStatus: "Order Successfully"),
        Plant(id: 4, imageName: "plant1", name: "Fiddle Leaf Fig", category: "Indoor", price: "$290", itemsLeft: 41, isPlant: true, orderStatus: "Order Successfully"),
        Plant(id: 5, imageName: "plant1", name: "Grey Star Calarthea", category: "Indoor", price: "$300", itemsLeft: 41, isPlant: true, orderStatus: "Order Successfully")
    ]
    
    @State private var searchResults = [Plant]()
    @State private var showResults = false
    @State private var noResultsFound = false
    private var debounceTimer = PassthroughSubject<String, Never>()
    @State private var cancellables = Set<AnyCancellable>()

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header
                HStack(alignment: .center) {
                    Button(action: {
                        // Action for back button
                    }) {
                        Image("ic_back")
                    }
                    .padding(10)
                    Text("SEARCH")
                        .font(Font.custom(fontLatoBold, size: 16))
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width - 96)
                    Spacer()
                }
                .frame(height: 44)
                .background(Color.white)
                
                // Search Bar
                HStack {
                    VStack(alignment: .leading) {
                        TextField("Search", text: $searchText)
                            .onChange(of: searchText) { newValue in
                                debounceTimer.send(newValue)
                            }
                            .font(Font.customFont(fontLatoRegular, size: 16))
                            .padding(.vertical, 10)
                            .background(Color.clear)
                    }
                    .padding(.leading, 40)
                    
                    Image("ic_search_tab")
                        .foregroundColor(.black)
                        .padding(.trailing, 40)
                }
                .overlay(
                    Rectangle()
                        .frame(height: 1.5)
                        .foregroundColor(Color.black)
                        .padding(.top, 8)
                        .padding(.leading, 40)
                        .padding(.trailing, 40),
                    alignment: .bottom
                )
                .padding(.vertical, 10)
                .background(Color.white)
                
                if showResults {
                    if noResultsFound {
                        Text("No Search Result Found!")
                            .font(Font.custom(fontLatoRegular, size: 16))
                            .foregroundColor(.black)
                            .padding(.top, 30)
                    } else {
                        List(searchResults, id: \.id) { item in
                            NavigationLink(destination: PlantDetailsView(objSearch: item)) {
                                HStack {
                                    Image(item.imageName)
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(8)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(item.name)
                                            .font(Font.custom(fontLatoRegular, size: 16))
                                        Text(item.price)
                                            .font(Font.custom(fontLatoRegular, size: 16))
                                            .foregroundColor(.black)
                                        Text("\(item.itemsLeft) items left")
                                            .font(Font.custom(fontLatoRegular, size: 14))
                                            .foregroundColor(.black)
                                    }
                                    Spacer()
                                }
                                .padding(.vertical, 5)
                            }
                            .listRowSeparator(.hidden, edges: .all)
                        }
                        .scrollIndicators(.hidden)
                        .padding(.top, 30)
                        .padding(.leading, 18)
                        .padding(.trailing, 18)
                        .listStyle(PlainListStyle())
                    }
                } else {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Recent searches")
                            .font(Font.custom(fontLatoRegular, size: 16))
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        
                        ForEach(recentSearches, id: \.self) { search in
                            HStack {
                                HStack {
                                    Image(systemName: "clock")
                                        .foregroundColor(.gray)
                                    Text(search)
                                        .font(Font.custom(fontLatoRegular, size: 16))
                                        .foregroundColor(.black)
                                }
                                Spacer()
                                Button(action: {
                                    removeRecentSearch(search)
                                }) {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top, 30)
                    .padding(.leading, 24)
                    .padding(.trailing, 24)
                }
                
                Spacer()
            }
            .background(Color.white)
            .ignoresSafeArea(.all, edges: .bottom)
            .padding(.bottom, tabBarHeight)
            .onAppear {
                setupDebounce()
            }
        }
        .navigationBarHidden(true)
    }
    
    private func setupDebounce() {
        debounceTimer
            .debounce(for: .seconds(1), scheduler: RunLoop.main)
            .sink { query in
                performSearch(query)
            }
            .store(in: &cancellables)
    }
    
    private func performSearch(_ query: String) {
        guard !query.isEmpty else {
            showResults = false
            return
        }
        // Simulated search results
        searchResults = arrSearch.filter({ $0.name.contains(query) })
        noResultsFound = searchResults.isEmpty
        showResults = true
    }
    
    private func removeRecentSearch(_ search: String) {
        recentSearches.removeAll { $0 == search }
    }
}

#Preview {
    SearchView()
}
