//
//  Sorting.swift
//  DAofAlgorithms
//
//  Created by Awal Amadou on 8/27/22.
//

import SwiftUI

class Sorting: ObservableObject {
    
    @Published var arrayConfig = [SortingInt]()
    
    func update(newConfig: [SortingInt]) {
//        self.objectWillChange.send()
        arrayConfig = newConfig
    }
}
