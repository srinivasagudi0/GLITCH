import SwiftUI


struct BrowserView: View {
    @State private var search = ""
    @State private var result = "Search for missing memory records."
    @Binding var recovered: Bool

    let database = [
        "reactor": "Record found. Enter recovery code 3000 to restore this memory.",
        "3000": "Memory recovered. Identity partially restored.",
        "owner": "Identity unavailable."
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
            ?? "No records found. Check you files for clues."
        
        if search.trimmingCharacters(in: .whitespacesAndNewlines) == "3000" {
            withAnimation(.easeInOut(duration: 1.0)) {
                recovered = true
            }
        }
    }
}