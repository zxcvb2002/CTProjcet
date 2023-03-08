//
//  ContentView.swift
//  CTProject08
//
//  Created by 드즈 on 2023/01/07.
//

import SwiftUI
import CoreData
 
struct ContentView: View {
    
    @State var isAnimating = false
    
    var body: some View {
        VStack {
            let anim = Animation
                .easeInOut(duration: 3)
                .repeatForever(autoreverses: false)
            
            let maxOpacity = 0.5
            
            ZStack {
                ForEach(0..<4, id: \.self) { i in
                    VStack {
                        Circle()
                            .scaleEffect(isAnimating ? 1 : 0.5)
                            .opacity(isAnimating ? 0 : maxOpacity)
                            .animation(anim.delay(Double(i)), value: isAnimating)
                    }
                }
                
                Circle()
                    .scaleEffect(0.5)
            }
            .foregroundColor(.blue)
            .frame(width: 200, height: 200)
            .onAppear { isAnimating.toggle() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



/*
import SwiftUI
import CoreData

struct RippleAnimation: View {
    @State var isAnimating = false
    
    var body: some View {
        VStack {
            let anim = Animation
                .easeInOut(duration : 3)
                .repeatForever(autoreverses: false)
            
            let maxOpacity = 0.5
            
            ZStack {
                Circle()
                    .scaleEffect(isAnimating ? 1 : 0.5)
                    .opacity(isAnimating ? 0 : maxOpacity)
                    .animation(anim, value: isAnimating)
                
                Circle()
                    .scaleEffect(isAnimating ? 1 : 0.5)
                    .opacity(isAnimating ? 0 : maxOpacity)
                    .animation(anim.delay(1), value: isAnimating)
                
                Circle()
                    .scaleEffect(isAnimating ? 1 : 0.5)
                    .opacity(isAnimating ? 0 : maxOpacity)
                    .animation(anim.delay(2), value: isAnimating)
                
                Circle()
                    .scaleEffect(isAnimating ? 1 : 0.5)
                    .opacity(isAnimating ? 0 : maxOpacity)
                    .animation(anim.delay(3), value: isAnimating)
                
                Circle()
                    .scaleEffect(0.5)
            }
            .foregroundColor(.blue)
            .frame(width: 200, height: 750 /* 200 */)
            .onAppear { isAnimating.toggle() }
            Spacer()
        }
    }
}

struct RippleAnimation_Previews: PreviewProvider {
    static var previews: some View {
        RippleAnimation()
    }
}
*/
