//
//  ContentView.swift
//  CTProject01
//
//  Created by 드즈 on 2022/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var animate = false
    
    var body: some View {
        Grid(horizontalSpacing: 3, verticalSpacing : 15) {
            ForEach(0..<50) { row in
                GridRow {
                    ForEach(0..<25) { col in
                        Capsule()
                            .frame(width: 15, height: 3)
                            .rotationEffect(.degrees(animate ? 360 : 0))
                            .animation(
                                .linear(duration: 1.5)
                                .repeatForever(autoreverses: false)
                                .delay(Double(row + col) * 0.05),
                                value : animate
                            )
                        }
                    }
                }
            }
            .onAppear { animate.toggle() }
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
