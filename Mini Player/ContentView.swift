//
//  ContentView.swift
//  Mini Player
//
//  Created by Nate Thompson on 9/22/20.
//

import SwiftUI

struct ContentView: View {
    
    private let titleBarHeight: CGFloat = 22.0
    
    var body: some View {
        ZStack {
            HStack {
                Image("mini-player")
                    .frame(width: 334, height: 63)
                Spacer(minLength: 0)
            }
            
            BackgroundView()
                .mouseDownCanMoveWindow()
            
            HStack(spacing: 0) {
                Spacer(minLength: 21)
                ControlsView()
                Spacer(minLength: 8)
                LCDView()
                Spacer(minLength: 9)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .frame(minWidth: 334, maxWidth: 500,
               maxHeight: 63 - titleBarHeight)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Image("mini-player")
            ContentView()
                .frame(width: 334, height: 63)
        }
    }
}
