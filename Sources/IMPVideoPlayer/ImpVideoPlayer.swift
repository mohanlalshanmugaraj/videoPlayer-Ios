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
    @Binding var videoUrl : String
    public var body: some View {
        VStack {
            VideoPlayer(player: AVPlayer(url: URL(string: videoUrl)!))
        }.edgesIgnoringSafeArea(.all)
    }
}
@available(iOS 14.0, *)
#Preview {
    ImpVideoPlayer(videoUrl: .constant("https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"))
}
