//
//  ContentView.swift
//  CTProject10
//
//  Created by 드즈 on 2023/01/07.
//

import SwiftUI
import CoreData

struct PieShape: Shape {
    var startPercent: Double
    var percent: Double
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(startPercent, percent) }
        set {
            startPercent = newValue.first
            percent = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        let from = startPercent * 360
        let to = from + (percent * 360)
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: .degrees(from), endAngle: .degrees(to), clockwise: false)
        return path
    }
}

struct PieChartAnimation: View {
    @State private var isAnimating = false
    let bluePercent = 0.1
    let yellowPercent = 0.3
    let greenPercent = 0.6
    
    var body: some View {
        VStack {
            ZStack {
                PieShape(startPercent: 0, percent: isAnimating ? bluePercent: 0)
                    .fill(.blue)
                
                PieShape(startPercent: isAnimating ? bluePercent: 0, percent: isAnimating ? yellowPercent : 0)
                    .fill(.yellow)
                
                PieShape(startPercent: isAnimating ? (yellowPercent + bluePercent) : 0, percent: isAnimating ? greenPercent : 0)
                    .fill(.green)
            }
            .frame(width: 200, height: 200, alignment: .center)
            .rotationEffect(.degrees(-90))
            
            Button("Animate") {
                withAnimation(.easeInOut) {
                    isAnimating.toggle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartAnimation()
    }
}



/*
 import SwiftUI
import CoreData

struct PieChartView: View, Animatable {
    var data: [Double : Color] = [:]
    var degrees = 0.0
    var animatableData: Double {
        get { degrees }
        set { degrees = newValue }
    }
    
    var body: some View {
        Canvas { context, size in
            let middlePoint = CGPoint(x: size.width / 2, y: size.height / 2)
            var startDegrees = 0.0
            data
                .sorted{ $0.key > $1.key }
                .forEach { (pieData, color) in
                    var path = Path()
                    path.move(to: middlePoint)
                    
                    let endDegrees = startDegrees + (360 * pieData)
                    
                    path.addArc(center: middlePoint, radius: middlePoint.x, startAngle: .degrees(degrees > startDegrees ? startDegrees : degrees), endAngle: .degrees(degrees > endDegrees ? endDegrees : degrees), clockwise: false)
                    path.closeSubpath()
                    
                    context.fill(path, with: .color(color))
                    
                    startDegrees = endDegrees
                }
        }
    }
}

struct AnimatedPieChart: View {
    @State var isAnimating = false
    var body: some View {
        VStack {
            PieChartView(data: [0.15: .cyan, 0.3: .blue, 0.55: .yellow], degrees: isAnimating ? 360 : 0)
                .frame(width: 200, height: 200, alignment: .center)
            
            Button("Animate") {
                withAnimation {
                    isAnimating.toggle()
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedPieChart()
    }
}
*/
