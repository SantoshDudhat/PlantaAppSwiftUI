//
//  TapToDismissModifier.swift
//  PlantaApp
//
//  Created by DREAMWORLD on 04/12/24.
//

import Foundation
import SwiftUI

struct TapToDismissModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                TapToDismissView()
            )
    }
}

struct TapToDismissView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator {
        @objc func dismissKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}
