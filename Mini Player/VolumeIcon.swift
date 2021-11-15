//
//  VolumeIcon.swift
//  Mini Player
//
//  Created by Nate Thompson on 9/28/20.
//

import SwiftUI

struct VolumeIcon: View {
    var level: VolumeIconShape.Level
    
    var width: CGFloat {
        switch level {
        case .low:
            return 9
        case .high:
            return 13
        }
    }
    
    var body: some View {
        ZStack {
            VolumeIconShape(level: level)
                .fill(Color(.sRGB, red: 0.85, green: 0.86, blue: 0.86))
                .offset(y: 1)

            VolumeIconShape(level: level)
                .fill(LinearGradient(
                        gradient: Gradient(colors: [
                            Color(.sRGB, red: 0.37, green: 0.38, blue: 0.38),
                            Color(.sRGB, red: 0.44, green: 0.44, blue: 0.45)
                        ]), startPoint: .top, endPoint: .bottom))
            
            VolumeIconShape(level: level)
                .offset(y: 1)
                .scale(1.2)
                .stroke(LinearGradient(
                            gradient: Gradient(colors: [
                                Color.black.opacity(0.5),
                                Color.black.opacity(0.2)
                            ]), startPoint: .top, endPoint: .bottom))
                .clipShape(VolumeIconShape(level: level))
        }
    }
    
    enum Level {
        case low
        case high
    }
}

struct VolumeIcon_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VolumeIcon(level: .low)
                .previewLayout(.fixed(width: 135, height: 150))

            VolumeIcon(level: .high)
                .previewLayout(.fixed(width: 195, height: 150))

        }
    }
}
