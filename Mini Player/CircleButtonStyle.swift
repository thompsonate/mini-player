//
//  CircleButtonStyle.swift
//  Shuffle
//
//  Created by Nate Thompson on 9/23/20.
//  Copyright © 2020 Nate Thompson. All rights reserved.
//

import SwiftUI

struct CircleButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .strokeBorder(Color(.sRGB, red: 0.87, green: 0.87, blue: 0.87))
                    .offset(y: 1)
                
                Circle()
                    .fill(RadialGradient(gradient: Gradient(colors: [
                        Color(.sRGB, red: 0.96, green: 0.96, blue: 0.96),
                        Color(.sRGB, red: 0.72, green: 0.74, blue: 0.75)
                    ]), center: .init(x: 0.5, y: 0.3),
                    startRadius: 6,
                    endRadius: 20))
                
                configuration.label
                
                if configuration.isPressed {
                    Circle()
                        .fill(RadialGradient(gradient: Gradient(colors: [
                            Color.black.opacity(0.05),
                            Color.black.opacity(0.2)
                        ]),center: .center,
                        startRadius: 0,
                        endRadius: geometry.size.width / 2))
                } else {
                    Circle()
                        .strokeBorder()
                        .shadow(color: .black, radius: 1)
                        .clipShape(Circle())
                }
                
                Circle()
                    .strokeBorder(Color(.sRGB, red: 0.4, green: 0.4, blue: 0.4))
            }
        }
    }
}
