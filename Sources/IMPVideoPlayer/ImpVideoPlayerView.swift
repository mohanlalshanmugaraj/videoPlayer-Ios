//
//  CustomView.swift
//  TestingAPP
//
//  Created by mohanlal on 23/10/23.
//

import UIKit
import SwiftUI

//https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4
@available(iOS 14.0, *)
public class ImpVideoPlayerView : UIView {
    var impVideoPlayer = ImpVideoPlayer(videoUrl: "")
    
    
    var hostingController: UIHostingController<ImpVideoPlayer>!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
          hostingController = UIHostingController(rootView: impVideoPlayer)
          hostingController.view.translatesAutoresizingMaskIntoConstraints = false
          
          addSubview(hostingController.view)
          
          NSLayoutConstraint.activate([
              hostingController.view.topAnchor.constraint(equalTo: topAnchor),
              hostingController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
              hostingController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
              hostingController.view.bottomAnchor.constraint(equalTo: bottomAnchor)
          ])
      }

    
    public func seturl(url : String) {
        self.pause()
        impVideoPlayer = ImpVideoPlayer(videoUrl: url)
          hostingController = UIHostingController(rootView: impVideoPlayer)
          hostingController.view.translatesAutoresizingMaskIntoConstraints = false
          
          addSubview(hostingController.view)
    
          NSLayoutConstraint.activate([
              hostingController.view.topAnchor.constraint(equalTo: topAnchor),
              hostingController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
              hostingController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
              hostingController.view.bottomAnchor.constraint(equalTo: bottomAnchor)
          ])
    }
    
    public func play() {
        impVideoPlayer.play()
    }
    
    public func pause() {
        impVideoPlayer.pause()
    }
    
    public func getCurrentTime() -> Double {
        return impVideoPlayer.currentTime.seconds
    }
}

