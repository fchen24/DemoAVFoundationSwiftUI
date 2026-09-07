import SwiftUI

struct ContentView: View {
    @State private var viewModel = DataModel()
    @State private var descriptionText = ""
    
    var body: some View {
        TabView {
            Tab("Audio", systemImage: "waveform") {
                NavigationStack {
                    VStack {
                        Text("Audio")
                            .font(.headline)
                            .navigationTitle("AVFoundation-Audio")
                            .navigationBarTitleDisplayMode(.inline)
                        Text(descriptionText)
                    }
                    .padding()
                }
                .task {
                    let tracks = await viewModel.loadMediaTracks()
                    descriptionText = tracks.description
                    print(tracks)
                }
            }
            
            Tab("Video", systemImage: "play.tv") {
                NavigationStack {
                    Text("Video")
                        .navigationTitle("AVFoundation-Video")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
