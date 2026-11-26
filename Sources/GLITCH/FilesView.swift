import SwiftUI

struct FilesView: View {
    @State private var selectedFile: String? 
    
    let files = [
        "readme.txt": "Memory corrupted. Search fpr the database to recover missing records.",
        "memory_01.txt": "I remember building a reactor. Search for it.",
        "research.txt": "Reactor records are stored in the database.",
        "classified.txt": "Security clearance required."
    ]

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ForEach(files.keys.sorted(), id: \.self) { file in
                    Button(file) {
                        selectedFile = file
                    }
                }
                Spacer()
            }
            .frame(width: 200)
            Divider()
            
            Text(files[selectedFile ?? ""] ?? "Select a file")
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .padding()
        .foregroundColor(.green)
        .background(Color.black)
    }
}
