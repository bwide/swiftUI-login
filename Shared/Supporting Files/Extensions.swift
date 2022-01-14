//
//  Extensions.swift
//  SwiftUILogin
//
//  Created by Bruno Wide on 14/01/22.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    var body: some View {
        HStack {
            DotView() // 1.
            DotView(delay: 0.2) // 2.
            DotView(delay: 0.4) // 3.
        }
    }
}

struct DotView: View {
    @State var delay: Double = 0 // 1.
    @State var scale: CGFloat = 0.5

    var body: some View {
        withAnimation {
            Circle()
                .foregroundColor(.white) // TODO light mode
                .frame(width: 10, height: 10)
                .scaleEffect(scale)
                .onAppear {
                    withAnimation(animation) { scale = 1 }
                }
        }
    }

    var animation: Animation {
        return .easeInOut(duration: 0.6).repeatForever().delay(delay)
    }
}

extension View {
    @ViewBuilder
    func background(color: SwiftUI.Color) -> some View {
        ZStack {
            color.ignoresSafeArea()
            self
        }
    }
}
