//
//  UIApplication.swift
//  CryptoCombine
//
//  Created by Amine Gannoun on 28/12/2024.
//

import SwiftUI

extension UIApplication {
    // dismiss keyboard
    func endEditing () {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
