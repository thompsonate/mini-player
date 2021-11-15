//
//  MiniPlayerWindowController.swift
//  Mini Player
//
//  Created by Nate Thompson on 11/14/21.
//

import Cocoa

class MiniPlayerWindowController: NSWindowController {
    init(contentView: NSView) {
        let window = NSWindow(
            contentRect: .zero,
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = contentView
        window.titlebarAppearsTransparent = true
        
        super.init(window: window)
        self.window = window
        
        if let closeButton = self.window?.standardWindowButton(NSWindow.ButtonType.closeButton) {
            closeButton.isHidden = true
        }
        if let miniaturizeButton = self.window?.standardWindowButton(NSWindow.ButtonType.miniaturizeButton) {
            miniaturizeButton.isHidden = true
        }
        if let zoomButton = self.window?.standardWindowButton(NSWindow.ButtonType.zoomButton) {
            zoomButton.isHidden = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
