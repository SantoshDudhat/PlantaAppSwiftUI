//
//  PlantGuideView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 05/12/24.
//

import SwiftUI

struct PlantGuideView: View {
    @Environment(\.presentationMode) var presentationMode
    let items = ["plant1", "plant2", "plant1"]
    let tags = ["Plant", "Indoor"]
    var objSearch: Plant
    
    @State private var expandedSection: SectionType? = nil
    @State private var expandedBasicKnowledgeIndex: Int? = nil
    @State private var expandedStagesIndex: Int? = nil

    var body: some View {
        ScrollView {
            VStack(spacing: 4) {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("ic_back")
                    }
                    
                    Spacer()
                    
                    Text(objSearch.name)
                        .font(Font.custom(fontLatoBold, size: 16))
                        .foregroundColor(.black)
                        .padding(.trailing, 20)
                    Spacer()
                }
                .padding(.horizontal, 16)
                .frame(height: 44)
                .background(Color.white)
                
                ZStack {
                    TabView {
                        ForEach(0..<items.count, id: \.self) { index in
                            PlantImageView(imageName: items[index])
                                .tag(index)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.35)
                    .tabViewStyle(.page(indexDisplayMode: .automatic))
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 6) {
                        ForEach(tags, id: \.self) { tag in
                            Text(tag)
                                .font(Font.customFont(fontLatoRegular, size: 14))
                                .padding(.vertical, 8)
                                .padding(.horizontal, 12)
                                .background(themeGreenColor)
                                .foregroundColor(.white)
                                .cornerRadius(4)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.top, 15)
                .padding(.leading, 30)
                
                // Expandable Sections
                VStack(spacing: 16) {
                    // Basic Knowledge Section
                    SectionExpandableView(
                        title: "Basic Knowledge",
                        isExpanded: expandedSection == .basicKnowledge,
                        toggleAction: {
                            expandedSection = (expandedSection == .basicKnowledge) ? nil : .basicKnowledge
                            expandedBasicKnowledgeIndex = nil
                        }
                    ) {
                        ForEach(0..<3, id: \.self) { index in
                            StepExpandableView(
                                step: "Step \(index + 1): \(getBasicKnowledgeDescription(for: index))",
                                description: "Light: Orchid grass belongs to the group of plants that prefer bright or partially shaded light. Natural light can be used, but the plant will burn if directly planted under sunlight.\n\nSoil: Ensure the soil has good drainage.\n\nWater: Distilled water or rainwater can be used, avoid using hard water. Water regularly, keeping the soil moist but not soggy.\n\nTemperature: Orchid grass thrives well at an optimal temperature ranging from 18 to 24 °C, suitable for the tropical climate in our country.\n...\n(Please purchase the product to unlock the comprehensive guide on planting from A to Z)",
                                isExpanded: expandedBasicKnowledgeIndex == index,
                                toggleAction: {
                                    expandedBasicKnowledgeIndex = (expandedBasicKnowledgeIndex == index) ? nil : index
                                }
                            )
                        }
                    }
                    .overlay(alignment: .top, content: {
                        if expandedSection != .basicKnowledge {
                            Rectangle()
                                .frame(height: 2)
                                .padding(.horizontal, 16)
                                .padding(.top, 50)
                                .foregroundColor(themeGreenColor)
                        }
                    })
                    .padding(.top, 16)
                    
                    // Stages Section
                    SectionExpandableView(
                        title: "Stages",
                        isExpanded: expandedSection == .stages,
                        toggleAction: {
                            expandedSection = (expandedSection == .stages) ? nil : .stages
                            expandedStagesIndex = nil
                        }
                    ) {
                        ForEach(0..<5, id: \.self) { index in
                            StepExpandableView(
                                step: "\(index + 1). \(getStagesDescription(for: index))",
                                description: "Water: Distilled water or rainwater can be used, avoid using hard water. Water regularly, keeping the soil moist but not soggy.",
                                isExpanded: expandedStagesIndex == index,
                                toggleAction: {
                                    expandedStagesIndex = (expandedStagesIndex == index) ? nil : index
                                }
                            )
                        }
                    }
                    .overlay(alignment: .top, content: {
                        if expandedSection == .basicKnowledge {
                            Rectangle()
                                .frame(height: 2)
                                .padding(.horizontal, 16)
                                .padding(.top, -8)
                                .foregroundColor(themeGreenColor)
                        }
                    })
                }
                .padding(.horizontal, 16)
            }
        }
        .scrollIndicators(.hidden)
        .background(Color.white)
        .padding(.bottom, tabBarHeight)
        .ignoresSafeArea(.all, edges: .bottom)
        .navigationBarHidden(true)
    }
    
    // Descriptions for Basic Knowledge steps
    func getBasicKnowledgeDescription(for index: Int) -> String {
        switch index {
        case 0: return "Prepare all tools and seeds"
        case 1: return "Seeding"
        case 2: return "Caring"
        default: return ""
        }
    }

    // Descriptions for Stages steps
    func getStagesDescription(for index: Int) -> String {
        switch index {
        case 0: return "Watering Seeds (48h)"
        case 1: return "Start Growing (3-5 days)"
        case 2: return "Growing (2-3 weeks)"
        case 3: return "Maturing (4-6 weeks)"
        case 4: return "Blooming (4-6 weeks)"
        default: return ""
        }
    }
}

#Preview {
    PlantGuideView(objSearch: Plant(id: 1, imageName: "plant1", name: "Spider Plant", category: "Indoor", price: "$250", itemsLeft: 120, isPlant: true, orderStatus: "Order Successfully"))
}
