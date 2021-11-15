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
        let x0 = rect.minX
        let x1 = rect.width * 4/11
        let x2 = rect.width * 7/11
        let x3 = rect.maxX
        
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
        let midX = rect.width * 7/15
        
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


struct VolumeIconShape: Shape {
    var level: Level
    
    var scaleWidth: CGFloat {
        switch level {
        case .low:
            return 9
        case .high:
            return 13
        }
    }
    
    func soundwave(in rect: CGRect, radius: CGFloat) -> Path {
        let x2 = rect.width * 6/scaleWidth
        let midY = rect.height * 0.5

        var path = Path()
        path.addArc(
            center: CGPoint(x: x2, y: midY),
            radius: rect.width * radius / scaleWidth,
            startAngle: .degrees(45),
            endAngle: .degrees(315),
            clockwise: true)
        return path.strokedPath(
            .init(lineWidth: rect.width / scaleWidth))
    }
    
    func path(in rect: CGRect) -> Path {
        let x1 = rect.width * 3/scaleWidth
        let x2 = rect.width * 6/scaleWidth
        
        let y1 = rect.height * 1/3
        let y2 = rect.height * 2/3
        
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: y1))
        path.addLine(to: CGPoint(x: x1, y: y1))
        path.addLine(to: CGPoint(x: x2, y: rect.minY))
        path.addLine(to: CGPoint(x: x2, y: rect.maxY))
        path.addLine(to: CGPoint(x: x1, y: y2))
        path.addLine(to: CGPoint(x: rect.minX, y: y2))
        path.addLine(to: CGPoint(x: rect.minX, y: y1))
        
        path.addPath(soundwave(in: rect, radius: 2.5))
        
        if level == .high {
            path.addPath(soundwave(in: rect, radius: 4.5))
            path.addPath(soundwave(in: rect, radius: 6.5))
        }
        
        return path
    }
    
    enum Level {
        case low
        case high
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
            
            VolumeIconShape(level: .low)
                .previewLayout(.fixed(width: 135, height: 150))
            
            VolumeIconShape(level: .high)
                .previewLayout(.fixed(width: 195, height: 150))
        }
    }
}
