//
//  ContentView.swift
//  CTProject02
//
//  Created by 드즈 on 2022/11/20.
//

import SwiftUI

let lightBlue = Color(UIColor(red: 0.25, green: 0.75, blue: 0.93, alpha: 1))

struct ContentView: View {
    
    let gradient = LinearGradient(gradient: Gradient(colors: [Color(.blue), lightBlue]), startPoint: .top, endPoint: .bottom)
    
    @State private var time: Double = 0
    @State private var animate = false
    @State private var offsetY: CGFloat = 210
    
    var body: some View {
        ZStack {
            
            Capsule()
                .frame(width: 100, height: 400)
                .foregroundColor(.white)
                .shadow(radius: 5)
            
            ZStack {
                CapsuleFluid(time: CGFloat(time*1.2))
                    .fill(lightBlue)
                    .frame(width: 100, height: 100)
                CapsuleFluid(time: CGFloat(time))
                    .fill(gradient)
                    .opacity(0.5)
                    .frame(width: 100, height: 100)
            }
            .offset(x: 0, y: self.offsetY)
            .mask(Capsule().frame(width: 100, height: 400))
        }
        .onAppear() {
            self.animate.toggle()
            Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { _ in
                self.time += 0.01
                if self.offsetY >= (-210.0) {
                    if self.animate {
                        withAnimation(Animation.linear(duration: 0.03)) {
                            self.offsetY -= 1.5
                        }
                    }
                }
            }
        }
    }
}

struct CapsuleFluid: Shape {
    var time: CGFloat
    func path(in rect: CGRect) -> Path {
        return (
            Path { path in
                let curveHeight: CGFloat = 8
                path.move(to: CGPoint(x: 100, y: 800))
                path.addLine(to: CGPoint(x: 0, y: 800))
                for i in stride(from: 0, to: CGFloat(rect.width), by: 1) {
                    path.addLine(to: CGPoint(x: i, y: sin(((i / rect.height) + time) * 4 * .pi) * curveHeight + rect.midY))
                }
                path.addLine(to: CGPoint(x: 100, y: 800))
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
