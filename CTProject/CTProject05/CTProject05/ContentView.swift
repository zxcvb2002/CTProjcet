//
//  ContentView.swift
//  CTProject05
//
//  Created by 드즈 on 2022/11/20.
//

import SwiftUI

struct ContentView: View {
    
    let size: CGFloat = 100
    
    var body: some View {
        VStack(spacing: size / 4) {
            HStack(spacing: size / 4) {
                ButtonAnimated(size: size, color: .red, image: "heart")
                ButtonAnimated(size: size, color: .blue, image: "shield")
            }
            HStack(spacing: size / 4) {
                ButtonAnimated(size: size, color: .purple, image: "bookmark")
                ButtonAnimated(size: size, color: .pink, image: "cross")
            }
        }
    }
}

struct ButtonAnimated: View {
    
    @State private var animate: Bool = false
    
    let size: CGFloat
    let color: Color
    let image: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: size * 1.2, height: size * 1.2)
                .foregroundColor(.clear)
            Button {
                animate.toggle()
            } label: {
                ZStack {
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .frame(width: size, height: size)
                            .foregroundColor(.clear)
                        HStack(alignment: .bottom, spacing: 0) {
                            ForEach(0..<5, id: \.self) { i in
                                Rectangle()
                                    .frame(width: size / 4, height: animate ? size * 1.1 : 0.5)
                                    .animation(.easeInOut.delay(0.1 * Double(i)), value: animate)
                                    .foregroundColor(color)
                                    .opacity(1 - (0.15 * Double(i)))
                            }
                        }
                    }
                    .rotationEffect(.degrees(45))
                    .mask {
                        Image(systemName: "\(image).fill")
                            .font(.system(size: size))
                    }
                    Image(systemName: image)
                        .font(.system(size: size))
                }
            }
            .buttonStyle(.plain)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
