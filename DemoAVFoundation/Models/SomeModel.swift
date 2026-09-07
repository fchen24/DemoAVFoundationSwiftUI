
import AVFoundation


@MainActor @Observable
class DataModel {
    func loadMediaTracks() async -> [AVAssetTrack]{
        guard let url = Bundle.main.url(
            forResource: "megaminouta",
            withExtension: "mp4") else {
            return []
        }
        let asset = AVURLAsset(url: url, options: nil)
        // load tracks
        do {
            let videoTracks = try await asset.loadTracks(withMediaType: .video)
            let audioTracks = try await asset.loadTracks(withMediaType: .audio)
            return videoTracks + audioTracks
        } catch {
            return []
        }
    }
}
