//
//  StatisticModel.swift
//  CryptoCombine
//
//  Created by Amine Gannoun on 28/12/2024.
//

import Foundation

struct StatisticModel : Identifiable {
    
    let id: String = UUID().uuidString
    let title: String
    let value: String
    let percentageChange : Double?
    
    init(title: String, value: String, percentageChange: Double? = nil){
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
    
}


