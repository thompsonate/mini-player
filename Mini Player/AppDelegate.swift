//
//  AppDelegate.swift
//  Mini Player
//
//  Created by Nate Thompson on 9/22/20.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var windowController: MiniPlayerWindowController!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()
        windowController = MiniPlayerWindowController(contentView: NSHostingView(rootView: contentView))
        windowController.window?.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

