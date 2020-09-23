//
//  CircleButton.swift
//  Mini Player
//
//  Created by Nate Thompson on 9/23/20.
//

import SwiftUI

struct CircleButton<Label>: View where Label: View {
    var action: () -> Void
    var icon: () -> Label
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white)
            
            Button(action: action, label: {
                ZStack {
                    Circle()
                        .fill(RadialGradient(gradient: Gradient(colors: [
                            Color(.sRGB, red: 0.96, green: 0.96, blue: 0.96),
                            Color(.sRGB, red: 0.72, green: 0.74, blue: 0.75)
                        ]), center: .init(x: 0.5, y: 0.3),
                        startRadius: 6,
                        endRadius: 20))
                    
                    Circle().stroke()
                        .shadow(color: .black, radius: 1, x: 0, y: 0)
                        .clipShape(Circle())

                    Circle()
                        .stroke(Color(.sRGB, red: 0.4, green: 0.4, blue: 0.4))
                    
                    icon()
                }
            })
            .padding(.bottom, 1)
            .buttonStyle(
                ShapeButtonStyle(
                    shape: Circle(),
                    mouseDownColor: Color.gray.opacity(0.5)))
        }
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(action: {}, icon: {
            CircleButtonIcon(shape: PauseIcon())
                .frame(width: 11, height: 11)
        })
        .frame(width: 30, height: 31)
    }
}
