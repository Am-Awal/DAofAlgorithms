//
//  CoolDripAnim.swift
//  DAofAlgorithms
//
//  Created by Awal Amadou on 8/29/22.
//

import SwiftUI

//struct CoolDripAnim: View {
//    @State private var offset: CGFloat = 350.0
//    @State var vals: BarViewModel = barViewTest
//    @State var heightAnchor: CGFloat = 0
//
//    var body: some View {
////        TimelineView(.animation) { context in
////            let scalefActor = 1
//
//            GeometryReader { geometry in
//                HStack(alignment: .bottom, spacing: 0) {
////                    GeometryReader { geometry in
//
//                    ForEach(vals.arrayConfig, id: \.id){ val in
//                        GeometryReader { gmry in
//
//                        let maxItem = vals.arrayConfig.max(by: { a, b in
//                            a.item < b.item
//                        })
////                        var heightAnchor: CGFloat = 0
//
//                        let gmHt = gmry.size.height/2
//                        let gmWdth = gmry.size.width*0.9
//
//                        let unit = gmHt / CGFloat(maxItem!.item)
//                        let maxHt = unit*CGFloat(val.item)
//                        let width = gmWdth/CGFloat(vals.arrayConfig.count)
////                        var strt: CGFloat = 0
//    //                    var maxHt = 0.0
//
//                            Rectangle()
//                            .fill(val.bgcolor)
//                                .frame(width: width)
////                                .frame(maxHeight: maxHt )
//                                .frame(height: heightAnchor)
//                                .shadow(radius: 30)
//                                .onAppear {
//                                    withAnimation(.linear(duration: 10).repeatForever()) {
//                                        heightAnchor = maxHt*5
//                                    }
////
//                                }
//                        }
//                    }
//
//                }
//                .frame(maxWidth: (geometry.size.width), maxHeight: geometry.size.height, alignment: .center)
//            }
//            .background(RoundedRectangle(cornerRadius: 30, style: .continuous).fill(Color.gray.opacity(0.1)))
//            .background(.ultraThinMaterial)
//            .shadow(radius: 30)
//            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
//
//
////            Circle()
////                .trim(from: 0, to: value)
////                .stroke()
////        }
//    }
//
//}

//struct CoolDripAnim_Previews: PreviewProvider {
//    static var previews: some View {
//        CoolDripAnim()
//    }
//}
