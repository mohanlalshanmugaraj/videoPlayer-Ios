//
//  SwiftUIView.swift
//  
//
//  Created by mohanlal on 23/10/23.
//
import SwiftUI
import AVKit

@available(iOS 14.0, *)
public struct ImpVideoPlayer: View {
    @State var videoUrl : String
    public var player: AVPlayer?
    @State public var currentTime: CMTime = .zero
    @State public var isPlaying = false
    
    @State var isNoDataFound = false
    
    public init(videoUrl : String) {
        self.videoUrl = videoUrl
        if (videoUrl == nil || videoUrl.isEmpty) {
            isNoDataFound = true
            self.player = nil
        }else {
            isNoDataFound = false
            self.player = AVPlayer(url: URL(string: videoUrl)!)
        }
    }
    
    public var body: some View {
        VStack {
            GeometryReader { geometry in
                if isNoDataFound {
                    Text("Video Not found")
                        .padding(50)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                } else {
                    ZStack {
                        VideoPlayer(player: player)
                            .onAppear {
                                player?.play()
                                isPlaying = true
                            }
                            .onDisappear {
                                player?.pause()
                                isPlaying = false
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    }
                    
                }
            }
        }
        .background(isNoDataFound ? Color.black : nil)
        .edgesIgnoringSafeArea(.all)
        .onReceive(NotificationCenter.default.publisher(for: .AVPlayerItemTimeJumped)) { _ in
            currentTime = player?.currentItem?.currentTime() ?? .zero
        }
    }
    
    func timeString(from time: CMTime) -> String {
            let seconds = CMTimeGetSeconds(time)
            let minutes = Int(seconds / 60)
            let secondsComponent = Int(seconds) % 60
            return String(format: "%02d:%02d", minutes, secondsComponent)
        }
    
    public func play() {
        player?.play()
    }
    
    public func pause() {
        player?.pause()
    }
    
}
@available(iOS 14.0, *)
#Preview {
    ImpVideoPlayer(videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
}
