//
//  ContentView.swift
//  CTProject09
//
//  Created by 드즈 on 2023/01/07.
//

import SwiftUI
import CoreData

struct BreatheView: View, Animatable {
    var radians: [Double] = [0, 45, 90, 135, 180, 225, 270, 315].map { $0 * .pi / 180 }
    
    var multiplier = 0.0
    
    var animatableData: Double {
        get { multiplier }
        set { multiplier = newValue }
    }
    
    var body: some View {
        Canvas { context, size in
            for radian in radians {
                var path = Path()
                path.move(to: .zero)
                
                let radius = size.width / 4
                let x = cos(radian) * radius
                let y = sin(radian) * radius
                
                let origin = CGPoint(x: x, y: y)
                let size = CGSize(width: radius * 2, height: radius * 2)
                let rect = CGRect(origin: origin, size: size).offsetBy(dx: radius, dy: radius)
                
                path.addEllipse(in: rect)
                
                context.fill(path, with: .color(.blue.opacity(0.5)))
            }
        }
    }
}

struct AppleWatchBreatheAnimation: View {
    @State var isAnimating = false
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                ZStack {
                    BreatheView(multiplier: isAnimating ? 1 : 0)
                }
                .scaleEffect(isAnimating ? 1 : 0.5)
                .rotationEffect(.degrees(isAnimating ? 180 : 0))
                .frame(width: 200, height: 200)
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                    isAnimating.toggle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppleWatchBreatheAnimation()
    }
}
