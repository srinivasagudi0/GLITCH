import SwiftUI

struct FilesView: View {
    @State private var selectedFile: String? 
    
    let files = [
        "memory_01.txt": "I need to get out of here.",
        "research.txt": "The  reactor is finally stable.",
        "classified.txt": "Acess denied.",
        "instruction.txt": "search the internal database.",
        "system.log": "Identity corrupted. Memory reconstruction is required.",
        "message.txt": "If you are reading this, then find me."
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
