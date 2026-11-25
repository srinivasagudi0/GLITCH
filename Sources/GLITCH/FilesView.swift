import SwiftUI

struct FilesView: View {
    @State private var selectedFile: String? 
    
    let files = [
        "memory_01.txt",
        "research.txt",
        "classified.txt"
    ]

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                forEach(files, id: \.self) {
                    file in 
                    Button(file) {
                        selectedFile = file
                    }
                }
                Spacer()
            }
            .frame(width: 200)
            Divider()
            Text(selectedFile ?? "Select a file")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding()
        .foregroundColor(.green)
    }
}