//
//  CircleButtonAnimationView.swift
//  CryptoCombine
//
//  Created by Amine Gannoun on 24/12/2024.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animate : Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : nil, value: UUID() )
            
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
        .foregroundStyle(.red)
        .frame(width: 100)
}
