//
//  String.swift
//  CryptoCombine
//
//  Created by Amine Gannoun on 03/01/2025.
//

import Foundation

extension String {
    
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
