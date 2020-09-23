//
//  CircleButtonIcon.swift
//  Mini Player
//
//  Created by Nate Thompson on 9/23/20.
//

import SwiftUI

struct CircleButtonIcon<Content: Shape>: View {
    var shape: Content
    
    var iconGradient: Gradient {
        Gradient(colors: [
            Color(.sRGB, red: 0.06, green: 0.06, blue: 0.06),
            Color(.sRGB, red: 0.42, green: 0.43, blue: 0.43)
        ])
    }
    
    var body: some View {
        ZStack {
            shape
                .fill(Color.white)
                .offset(y: 1)
            
            shape
                .fill(LinearGradient(
                        gradient: iconGradient,
                        startPoint: .top,
                        endPoint: .bottom))
        }
    }
}

struct CircleButtonIcon_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonIcon(shape: PauseIcon())
    }
}
