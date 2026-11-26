import SwiftUI
import AppKit

@main
struct GLitchApp: App {

    init() {
        NSApplication.shared.setActivationPolicy(.regular)
        NSApplication.shared.activate(ignoringOtherApps: true)
    }

    var body: some Scene {
        WindowGroup {
            DesktopView()
        }
        .windowStyle(.hiddenTitleBar)
    }
}