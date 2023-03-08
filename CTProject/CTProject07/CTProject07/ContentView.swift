//
//  ContentView.swift
//  CTProject07
//
//  Created by 드즈 on 2022/12/14.
//

import SwiftUI

struct ContentView: View {
    
    @State private var toggled = false
    @State private var tilt = false
    @State private var circleSize: CGFloat = 0
    @State private var darkmode = false
    
    let size: CGFloat = 50
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.primary)
                .frame(width: circleSize, height: circleSize)
            Capsule()
                .frame(width: size * 2, height: size)
            ZStack {
                Capsule()
                    .foregroundColor(toggled ? .green : .gray)
                    .frame(width: size * 2, height: size)
                Circle()
                    .foregroundColor(.white)
                    .frame(width: size * 0.9, height: size * 0.9)
                    .offset(x: -size / 2)
                    .offset(x: toggled ? size : 0)
                    .shadow(radius: 2)
            }
            .animation(.easeIn(duration: 0.3).delay(0.2), value: toggled)
            .rotation3DEffect(.degrees(tilt ? toggled ? 20 : -20 : 0), axis: (x:0, y: 1, z: 0))
            .animation(.easeIn(duration: 0.2), value: tilt)
            .onTapGesture { animate() }
        }
        .preferredColorScheme(darkmode ? .dark : .light)
    }
        
    private func animate() {
        circleSize = 0
        toggled.toggle()
        tilt = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            tilt = false
            withAnimation(.easeIn) {
                circleSize = UIScreen.main.bounds.height * 1.2
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                darkmode.toggle()
                circleSize = 0          
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
