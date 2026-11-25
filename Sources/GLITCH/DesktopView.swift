import SwiftUI

struct DesktopView: View {

    @State private var activeApp: String? = nil

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
                    .onTapGesture(count: 2) {
                        activeApp = "Files"
                    }
                DesktopIcon(name: "Browser", icon: "safari")
                    .onTapGesture(count: 2) {
                        activeApp = "Browser"
                    }

            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .padding(25)
        }
        .frame(minWidth: 900, minHeight: 600)
        if let app = activeApp {
            VStack {
                HStack {
                    Text(app)
                    Spacer()
                    Button("x") {
                        activeApp = nil
                    }
                }
                .padding()
                Divider()
                Spacer()
                Text("NO data available")
                Spacer()
            }
            .frame(minWidth: 500, minHeight: 350)
            .background(Color.black)
            .border(Color.green)
        }
    }
}