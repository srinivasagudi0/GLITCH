import SwiftUI

struct MemoryView: View {
    @Binding var identified: Bool
    @State private var index = 0
    @State private var running = false
    @State private var selected: [String] = []
    @State private var message = "Restore the correct sequence."

    let correctOrder = [
        "boot", "Reactor", "Identity", "Transmission"
    ]

    @State private var fragments = [
        "TRANSFORM", "BOOT", "IDENTITY", "REACTOR" 
    ]

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

            if !identified && !running {
                Text("CORRUPTED MEMORY BLOCKS")
                    .foregroundColor(.gray)

                Text("Hint: Star the system, restore power, verify the owner, then resttore communication.")
                    .foregroundColor(.gray)
                    .font(.system(.body, design: .monospaced))
            }


            ForEach(0..<index, id: \.self) { i in 
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

    func reconstruct() {
        running = true

        Task {
            for i in 1...logs.count {
                try? await Task.sleep(for: .milliseconds(650))

                withAnimation {
                    index = i
                }
            }
            identified = true
            running = false
        }
    }
}