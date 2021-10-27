//
//  VideoViewController.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/22.
//

import UIKit
import YoutubePlayer_in_WKWebView

class VideoViewController: UIViewController {

    private var musicVideoViewModel: MusicVideoViewModelType?
    private var videoView: WKYTPlayerView!
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIDeviceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        viewConfiguration()
        configureVideoView()
        self.videoView.delegate = self
        self.videoView.load(withVideoId: musicVideoViewModel?.youtubeIdReturn() ?? "", playerVars: ["playsinline":1])
    }
    
    private func configureVideoView() {
        videoView = WKYTPlayerView()
        self.view.addSubview(videoView)
        videoView.translatesAutoresizingMaskIntoConstraints = false
        videoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        videoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        videoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        videoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func viewConfiguration() {
        self.view.backgroundColor = .black
    }
    
    func showMusicVideoViewController(with viewModel: MusicVideoViewModelType) {
        self.musicVideoViewModel = viewModel
    }

}

extension VideoViewController: WKYTPlayerViewDelegate {
    
    func playerViewDidBecomeReady(_ playerView: WKYTPlayerView) {
        playerView.playVideo()
    }
    
}
