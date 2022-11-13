//
//  BarView Column.swift
//  DAofAlgorithms
//
//  Created by Awal Amadou on 8/31/22.
//

import SwiftUI

struct BarView_Column: View {
//    @EnvironmentObject var BVM: BarViewModel
    
//    let i: Int
//    let j: Int
//    let date: Date
    let maxHt: CGFloat
    let width: CGFloat
    
//    var arrayConfig: [SortingInt]  { }
//    var val: SortingInt {BVM.arrayConfig[i][j]}
    var val: SortingInt
    
    
    
    var body: some View {
//        let maxItem = arrayConfig.max(by: { a, b in
//            a.item < b.item
//        })
//
//        let gmHt = geometry.size.height/2
//        let gmWdth = geometry.size.width*0.9
//
//        let unit = gmHt / CGFloat(maxItem!.item)
//        let maxHt = unit*CGFloat(val.item)
//        let width = gmWdth/CGFloat(arrayConfig.count)
        Rectangle()
            .fill(val.bgcolor)
            .frame(width: width)
            .frame(maxHeight: maxHt)
    }
}

//struct BarView_Column_Previews: PreviewProvider {
//    static var previews: some View {
//        BarView_Column()
//    }
//}
