import SwiftUI

struct BrowserView: View {
    @State private var search = ""
    @State private var result = "Awaiting input..."

    let database = [
        "reactor": "Experimental energy source. Project ID: 3000."
    ]

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Search database...", text: $search)
                    .onSubmit {
                        lookup()
                    }

                Button("Search") {
                    lookup()
                }
            }

            Divider()

            Text(result)
                .font(.system(.body, design: .monospaced))

            Spacer()
        }
        .padding()
        .foregroundColor(.green)
    }

    func lookup() {
        result = database[search.lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)]
            ?? "No records found."
    }
}