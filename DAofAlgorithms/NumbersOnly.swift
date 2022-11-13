//
//  NumbersOnly.swift
//  DAofAlgorithms
//
//  Created by Awal Amadou on 8/27/22.
//
import SwiftUI
class NumbersOnly: ObservableObject {
    
@Published var value = "" {
    didSet {
        let filtered = value.filter { $0.isNumber }
        
        if value != filtered {
            value = filtered
        }
    }
}
}
