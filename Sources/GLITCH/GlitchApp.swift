import SwiftUI

@main
struct GLitchApp: App {
    var body: some Scene {
        WindowGroup {
            DesktopView()
        }
        .windowStyle(.hiddenTitleBar)
    }
}