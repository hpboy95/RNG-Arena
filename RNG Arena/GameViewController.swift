//
//  GameViewController.swift
//  RNG Arena
//
//  Created by Hezekiah Valdez on 10/14/16.
//  Copyright © 2016 Hezekiah Valdez. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {

    var scene: GameScene!
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Configure the view of victory
        let skView = self.view as! SKView
        
        //Create and configure scene
        scene = GameScene(size: skView.bounds.size) //Fill to boundries of the scene
        scene.scaleMode = .aspectFit //Set aspect ratio
        
        //Present the screen
        skView.presentScene(scene)
        
        //Background Music
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "RetroHeroes", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
        catch {
            print(error)
        }
        
    }

    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // Turn music on/off.
    @IBAction func mute(_ sender: UIButton) {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
            sender.setTitle("🔇", for: .normal)
        }
        else {
            audioPlayer.play()
            sender.setTitle("🔈", for: .normal)
        }
    }
    
}
