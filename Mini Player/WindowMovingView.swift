//
//  WindowMovingView.swift
//  Mini Player
//
//  Created by Nate Thompson on 2/16/20.
//  Copyright © 2020 Nate Thompson. All rights reserved.
//

import SwiftUI

extension View {
    func mouseDownCanMoveWindow() -> some View {
        return overlay(WindowMovingView())
    }
}


fileprivate struct WindowMovingView: NSViewRepresentable {
    typealias NSViewType = SHWindowMovingView

    func makeNSView(context: NSViewRepresentableContext<WindowMovingView>) -> SHWindowMovingView {
        return SHWindowMovingView()
    }
    
    func updateNSView(_ nsView: SHWindowMovingView, context: NSViewRepresentableContext<WindowMovingView>) {
        
    }
}


// https://stackoverflow.com/a/57756624/
fileprivate class SHWindowMovingView: NSView {
    override func mouseDown(with event: NSEvent) {
        window?.performDrag(with: event)
    }
    
    override func acceptsFirstMouse(for event: NSEvent?) -> Bool {
        return true
    }
}
