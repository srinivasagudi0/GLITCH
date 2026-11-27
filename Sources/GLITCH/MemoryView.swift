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

    
}