//
//  GameViewController.swift
//  FlappyDragon
//
//  Created by Higor Jugler on 3/19/24.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {
    
    var stage: SKView!
    var musicPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stage = view as! SKView
        stage.ignoresSiblingOrder = true
        
        presentScene()
        //        playMusic()
    }
    
    func playMusic() {
        
        if let musicURL = Bundle.main.url(forResource: "music", withExtension: "m4a") {
            musicPlayer = try! AVAudioPlayer(contentsOf: musicURL)
            musicPlayer.numberOfLoops = -1
            musicPlayer.volume = 0.6
            musicPlayer.play()
        }
        //        if let musicUrl = Bundle.main.url(forResource: "music", withExtension: "m4a") {
        //            let musicAction = SKAction.playSoundFileNamed("music.m4a", waitForCompletion: true)
        //            let playAction = SKAction.repeatForever(musicAction)
        //            stage.scene?.run(playAction)
        //        }
    }
    
    func presentScene() {
        let scene = GameScene(size: CGSize(width: 320, height: 568))
        scene.gameViewController = self
        scene.scaleMode = .aspectFill
        //        stage.presentScene(scene)
        stage.presentScene(scene, transition: .doorsOpenVertical(withDuration: 0.5))
        
        playMusic()
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
