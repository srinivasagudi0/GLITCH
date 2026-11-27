import SwiftUI

struct MemoryView: View {
    @Binding var identified: Bool
    @State private var index = 0
    @State private var running = false

    let logs = [
        "Initializing memory reconstruction...",
        "Recovering damaged records...",
        "Analyzing reactor signatures...",
        "Identity confirmed: T.S",
        "Warning: Owner location unknown.",
        "Last transmission recovered.",
        "Stark Industies acess authorized."
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Memory Reconstruction")
                .font(.title2)
            
            Divider()

            ForEach(0..<logs.count, id: \.self) { i in 
                Text("> " + logs[i])
            }

            Spacer()

            ProgressView(
                value: Double(index),
                total: Double(logs.count)
            )
            .tint(.green)

            Button(identified ? "Access Authorized" : "Reconstruct Memory") {
                reconstruct()
            }
            .disabled(running || identified)
        }
        .padding(25)
        .foregroundColor(.green)
        .font(.system(.body, design: .monospaced))
        .task {
            if identified {
                index = logs.count
            }
        }
    }

}