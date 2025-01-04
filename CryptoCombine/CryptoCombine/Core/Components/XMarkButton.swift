//
//  XMarkButton.swift
//  CryptoCombine
//
//  Created by Amine Gannoun on 03/01/2025.
//

import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
        }
    }
}

#Preview {
    XMarkButton()
}
