//
//  ViewController.swift
//  EmergencyApp
//
//  Created by Rebwar Ebrahimi on 6/22/22.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var videoPlayer:AVPlayer?
    var videoPlayerLayer:AVPlayerLayer?
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        setUpElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //setup video
        
        setUpVideo()
    }
    
    func setUpElements(){
        
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
        
    }
    
    func setUpVideo(){
        //get the path to resource in the bundel
       let bundelPath = Bundle.main.path(forResource: "media", ofType: "mp4")
        guard bundelPath != nil else{
            return
        }
        
        //create a url from it
         
        let url = URL(fileURLWithPath: bundelPath!)
        //created video player
        let playerItem = AVPlayerItem(url: url)
        
        //crate player
        videoPlayer = AVPlayer(playerItem: playerItem )
        
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer)
        
        //set the frame of AVPlayerLayer
        videoPlayerLayer?.frame=CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        
        //play video
        
        videoPlayer?.playImmediately(atRate: 0.3)
        
    }

}

