//
//  SortingIntsInts.swift
//  DAofAlgorithms
//
//  Created by Awal Amadou on 8/27/22.
//

import SwiftUI

struct SortingInt: Identifiable {
    
    let id: UUID
    var item: Int
    var bgcolor: Color
}

//var sortingIntsTest = SortingInts(id: UUID(), item: Array(0...10).shuffled(), bgcolor: .red)

var sortingIntsTest = [
    SortingInt(id: UUID(), item: 0, bgcolor: .red),
    SortingInt(id: UUID(), item: 1, bgcolor: .green),
    SortingInt(id: UUID(), item: 2, bgcolor: .blue),
    SortingInt(id: UUID(), item: 3, bgcolor: .purple),
]
