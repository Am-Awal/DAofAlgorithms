//
//  DAofAlgorithmsApp.swift
//  DAofAlgorithms
//
//  Created by Awal Amadou on 8/27/22.
//

import SwiftUI

@main
struct DAofAlgorithmsApp: App {
    
    @StateObject var sorting = Sorting()
//    @StateObject var BVM = BarViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environmentObject(BVM)
                .environmentObject(sorting)
//                .preferredColorScheme(.light)
        }
    }
}
