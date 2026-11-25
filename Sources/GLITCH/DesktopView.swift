import SwiftUI

struct DesktopView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("Glitch")
                    .font(.system(
                        size: 60,
                        weight: .light,
                        design: .monospaced
                    ))
                    .tracking(15)
                    .foregroundColor(.green)
                Text("System 01")
                    .tracking(5)
                    .foregroundColor(.gray)
                Text("Everything is functioning normally")
                    .font(.system(size: 12))
                    .foregroundColor(.gray.opacity(0.5))
            }
            
        }
        VStack {
            DesktopIcon(name: "Files", icon: "folder")
        }
        .frame(minWidth: 400, minHeight: 600)
    }
}