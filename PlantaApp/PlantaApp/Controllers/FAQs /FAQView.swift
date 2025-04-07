//
//  FAQView.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 05/12/24.
//

import SwiftUI

struct FAQView: View {
    struct FAQItem: Identifiable {
        let id = UUID()
        let question: String
        let answer: String
    }
    @Environment(\.presentationMode) var presentationMode
    @State private var expandedItem: UUID? = nil

    let faqItems = [
        FAQItem(question: "How long will it take for my order to arrive?", answer: "Orders placed via Standard shipping will be processed within 2-3 business days and delivered in 5-7 business days. Expedited shipping will be processed within 1-2 business days and will be delivered in 1-5 days."),
        FAQItem(question: "Where do you ship?", answer: "We ship to all 63 provinces in Vietnam."),
        FAQItem(question: "If I order more than one plant, will they ship separately?", answer: "Yes, each individual plant ships separately. Plants that are part of the same order may ship out on different days."),
        FAQItem(question: "How do I order several plants to go to different addresses?", answer: "If you're placing multiple purchases or 5+ plants, please contact our customer support team with your order number and shipping address details."),
        FAQItem(question: "What if I need to cancel my order?", answer: "We begin work on each order soon after it's placed. You can cancel your order by contacting customer support, as long as it hasn't shipped yet.")
    ]

    var body: some View {
        HStack(alignment: .center) {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image("ic_back")
            }
            Text("FAQs")
                .font(Font.custom(fontLatoBold, size: 16))
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width - 96)
            Spacer()
        }
        .frame(height: 44)
        .background(Color.white)
        .padding(.horizontal, 16)
        VStack {
            List {
                ForEach(faqItems) { item in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(item.question)
                                .font(Font.custom(fontLatoBold, size: 16))

                            Spacer()
                            
                            Button(action: {
                                if expandedItem == item.id {
                                    expandedItem = nil
                                } else {
                                    expandedItem = item.id
                                }
                            }) {
                                Image(expandedItem == item.id ? "faq_up_arrow" : "faq_down_arrow")
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.vertical, 8)
                        
                        if expandedItem == item.id {
                            Text(item.answer)
                                .font(Font.custom(fontLatoRegular, size: 16))
                                .foregroundColor(.gray)
                                .padding(.bottom, 8)
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
        }
        .padding(.horizontal, 16)
        .navigationBarHidden(true)
    }
}

#Preview {
    FAQView()
}
