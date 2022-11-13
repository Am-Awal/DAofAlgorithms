//
//  AnimatedBox.swift
//  DAofAlgorithms
//
//  Created by Awal Amadou on 8/28/22.
//

import SwiftUI

struct AnimatedBox: View {
    @State var rotation = 0.0
    @State var scaleXY = 1.0
    @State private var offset: CGFloat = 350.0
    @State private var sz = 10
    @State var randColr = Color(
        red: .random(in: 0...1),
        green: .random(in: 0...1),
        blue: .random(in: 0...1))
    
    var body: some View {
//        Rectangle()
        VStack {
            ForEach(0...(sz-1), id: \.self){i in
                
                Image(systemName: "snowflake")
                    .font(.largeTitle)
                    .foregroundColor(randColr)
                //            .background(randColr)
                    .background(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(randColr))
                    .background(.ultraThinMaterial)
                    .mask(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                    )
                    .shadow(radius: 10.0)
                    .rotationEffect(.degrees(rotation))
                    .scaleEffect(CGFloat(scaleXY))
                    .offset(y: offset-Double(sz*sz)*1.5)
                    
            }
            .onTapGesture {
                rotation += 360
                scaleXY += 0.333
                if offset <= 200{
                    offset = 350
                    rotation = 0.0
                    scaleXY = 1.0
                }
                offset -= 50
            }
            .animation(Animation.easeInOut(duration: 3).speed(4), value: offset)}
        
        
    }
}

struct AnimatedBox_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedBox()
    }
}
