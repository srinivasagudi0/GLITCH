import SwiftUI

struct DesktopView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("Memory_01")
                    .font(.system(
                        size: 60,
                        weight: .light,
                        design: .monospaced
                    ))
                    .tracking(15)
                    .foregroundColor(.green)
                Text("Identity: 0x00000000")
                    .tracking(5)
                    .foregroundColor(.gray)
                Text("Memory Reconstruction System")
                    .font(.system(size: 12))
                    .foregroundColor(.gray.opacity(0.5))
            }

            VStack {
                DesktopIcon(name: "Files", icon: "folder")
                DesktopIcon(name: "Browser", icon: "safari")

            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .padding(25)
        }
        .frame(minWidth: 900, minHeight: 600)
    }
}