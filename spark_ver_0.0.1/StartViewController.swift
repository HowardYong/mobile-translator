//
//  ViewController.swift
//  spark_ver_0.0.1
//
//  Created by Howard Yong on 4/9/19.
//  Copyright © 2019 Howard Yong. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class StartViewController: UIViewController {

    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        // Do any additional setup after loading the view.
        //setupView_gradient()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*private func setupView_video() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: "test_02", ofType: "mov")!)
        let player = AVPlayer(url: path)
        
        let newLayer = AVPlayerLayer(player: player)
        newLayer.frame = self.videoView.frame
        self.videoView.layer.addSublayer(newLayer)
        newLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        player.play()
        player.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        
        NotificationCenter.default.addObserver(self, selector: #selector(StartViewController.videoDidPlayToEnd(_:)), name: NSNotification.Name(rawValue: "AVItemDidPlayToEndTimeNotification"), object: player.currentItem)
    }

    @objc func videoDidPlayToEnd(_ notification: Notification) {
        let player: AVPlayerItem = notification.object as! AVPlayerItem
        player.seek(to: CMTime.zero)
    }*/
    
   /* private func setupView_gradient() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        gradientView.frame = topView.bounds
        
        let attributedText = NSMutableAttributedString(string: "Welcome to Spark", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)])
        attributedText.append(NSAttributedString(string: "\nStart Investing Green", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.thin)]))
        let label1 = UILabel(frame: gradientView.bounds)
        label1.numberOfLines = 2

        label1.attributedText = attributedText
        label1.textAlignment = .center
        //gradientView.addSubview(label1)
        
        /*let label2 = UILabel(frame: gradientView.bounds)
        label2.text = "Start Investing Green"
        label2.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.thin)
        gradientView.addSubview(label2)*/
        
        
        // Tha magic! Set the label as the views mask
        //gradientView.mask = label1
        
    }*/
    
}


