import SwiftUI

struct StarkView: View {
    @Binding var completed: Bool
    @State private var scanning = false
    @State private var progress = 0

    let logs = [
        "JARVIS: Welcome to Stark Industries.",
        "JARVIS: Mr. Stark has gone missing.",
        "Acessing satellite network...",
        "Matching reactor energy signature...",
        "Signal detected.",
        "Location: Gulmira, Afghanistan.",
        "JARVIS: We found him."
    ]

    var body: some View {
        VStack {
            Text("Stark Industries")
                .font(.system(size: 30, weight: .light))
                .tracking(5)
            Text("J.A.R.V.I.S - ONLINE")
                .font(.caption)

            Divider()

            ForEach(0..<progress, id: \.self) { i in
                Text("> " + logs[i])
            }

            Spacer()

            ProgressView(
                value: Double(progress),
                total: Double(logs.count)
            ).tint(.cyan)

            if completed {
                Text("Mission Complete")
                    .font(.title)
                    .foregroundColor(.green)
                
                Text("TONY STARK LOCATED")
            } else {
                Button(scanning ? "Scanning..." : "Locate Tony Stark") {
                   scan()
                }.disabled(scanning)
            }
            
        }
        .padding(25)
        .foregroundColor(.green)
        .font(.system(.body, design: .monospaced))
        .task {
            if completed {
                progress = logs.count
            }
        }

        
    }
    func scan() {
        scanning = true

        Task {
            for i in 1...logs.count {
                try? await Task.sleep(for: .seconds(1))
                withAnimation {
                    progress = i
                }
            }
            withAnimation {
                completed = true
                scanning = false
            }
        }
    }
}