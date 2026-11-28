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
                Button(action: {
                    Button(scanning ? "Scanning..." : "Start Scanning") {
                        scan()
                    } 
                })
            }

        }
    }

}