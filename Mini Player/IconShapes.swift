//
//  IconShapes.swift
//  Shuffle
//
//  Created by Nate Thompson on 2/12/20.
//  Copyright © 2020 Nate Thompson. All rights reserved.
//

import SwiftUI

struct PlayIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))

        return path
    }
}


struct PauseIcon: Shape {
    func path(in rect: CGRect) -> Path {
        let x0: CGFloat = 0.0
        let x1 = rect.width * 0.35
        let x2 = rect.width * 0.65
        let x3 = rect.width
        
        var leftPath = Path()
        leftPath.move(to: CGPoint(x: x1, y: rect.minY))
        leftPath.addLine(to: CGPoint(x: x0, y: rect.minY))
        leftPath.addLine(to: CGPoint(x: x0, y: rect.maxY))
        leftPath.addLine(to: CGPoint(x: x1, y: rect.maxY))
        leftPath.addLine(to: CGPoint(x: x1, y: rect.minY))
        leftPath.addLine(to: CGPoint(x: x0, y: rect.minY))
        
        var rightPath = Path()
        rightPath.move(to: CGPoint(x: x3, y: rect.minY))
        rightPath.addLine(to: CGPoint(x: x2, y: rect.minY))
        rightPath.addLine(to: CGPoint(x: x2, y: rect.maxY))
        rightPath.addLine(to: CGPoint(x: x3, y: rect.maxY))
        rightPath.addLine(to: CGPoint(x: x3, y: rect.minY))
        rightPath.addLine(to: CGPoint(x: x2, y: rect.minY))

        leftPath.addPath(rightPath)
        return leftPath
    }
}


struct TrackSkipIcon: Shape {
    let direction: Direction
    
    func path(in rect: CGRect) -> Path {
        let midX = rect.width * 0.5
        
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: midX, y: rect.midY))
        path.addLine(to: CGPoint(x: midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: midX, y: rect.minY))
        path.addLine(to: CGPoint(x: midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        switch direction {
        case .next:
            return path
        case .previous:
            // flip horizontally
            let transform = CGAffineTransform(translationX: rect.width, y: 0)
                .scaledBy(x: -1, y: 1)
            return path.applying(transform)
        }
    }
    
    enum Direction {
        case next
        case previous
    }
}


struct IconShapes_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayIcon()
                .previewLayout(.fixed(width: 150, height: 150))
            
            PauseIcon()
                .previewLayout(.fixed(width: 150, height: 150))
            
            TrackSkipIcon(direction: .next)
                .previewLayout(.fixed(width: 150, height: 90))
        }
    }
}
