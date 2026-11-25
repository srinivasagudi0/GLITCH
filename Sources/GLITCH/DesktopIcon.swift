import SwiftUI

struct DesktopIcon: View {
    let name: String
    let icon: String
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 32))
            Text(name)
                .font(.system(size: 12, design: .monospaced))
        }
        .foregroundColor(.green)
        .frame(width: 80, height: 80)
    }
}