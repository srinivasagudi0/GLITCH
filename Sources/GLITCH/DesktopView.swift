import SwiftUI

struct DesktopView: View {

    @State private var activeApp: String? = nil
    @State private var identified = false
    @State private var recovered = false

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
                Text(recovered ? "Identity: T.S" : identified ? "Identity: Tony Stark" : "Identity: 0x00000000")
                    .tracking(5)
                    .foregroundColor(.gray)
                Text(identified ? "Memory recovered: 50%" : recovered ? "Memory recovered: 25%" : "Memory Reconstruction System")
                    .font(.system(size: 12))
                    .foregroundColor(.gray.opacity(0.5))
            }

            VStack {
                DesktopIcon(name: "Files", icon: "folder")
                    .onTapGesture(count: 2) {
                        activeApp = "Files"
                    }
                DesktopIcon(name: "Database", icon: "externaldrive")
                    .onTapGesture(count: 2) {
                        activeApp = "Browser"
                    }
                
                if recovered {
                    DesktopIcon(name: "Memory_02", icon: "lock.open")
                        .onTapGesture(count: 2) {
                            activeApp = "Memory"
                        }
                }

                if identified {
                    DesktopIcon(name: "Stark Industries", icon: "network")
                        .onTapGesture(count: 2) {
                            activeApp = "Stark"
                        }
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
                if app == "Files" {
                    FilesView()
                } else if app == "Browser" {
                    BrowserView(recovered: $recovered)
                } else if app == "Memory" {
                    MemoryView(identified: $identified)
                } else if app == "Stark" {
                    Text("Secure network connected.")
                        .foregroundColor(.green)
                }

                Spacer()
            }
            .frame(minWidth: 500, minHeight: 350)
            .background(Color.black)
            .border(Color.green)
        }
    }
}