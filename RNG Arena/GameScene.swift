//
//  GameScene.swift
//  RNG Arena
//
//  Created by Hezekiah Valdez on 10/14/16.
//  Copyright © 2016 Hezekiah Valdez. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //Image definitions
    var background: SKNode!
    var imageMonster: SKNode!
    
    //HUD definitions with player score and enemy description
    var hud:SKNode = SKNode()
    var scoreLabel = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
    var playerHP = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
    
    //Button definitions
    var button1: SKSpriteNode!
    var button2: SKSpriteNode!
    var button3: SKSpriteNode!
    var button4: SKSpriteNode!

    //State definitions
    let game = RAEngine()
    var scaleFactor:CGFloat!
    var gameOver = false
    
    //Required init because of override init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size:CGSize){
        super.init(size: size)
    
        scaleFactor = self.size.width / 320
        backgroundColor = SKColor(colorLiteralRed: 6/255, green: 150/255, blue: 35/255, alpha: 1)
        
        //let levelData = RAEngine.sharedInstance.levelData
        
        //Create HUD
        let xpos = self.size.width / 5
        let ypos = (self.size.height / 7)
        
        button1 = createButton()
        button2 = createButton()
        button3 = createButton()
        button4 = createButton()
        
        scoreLabel.fontSize = 26
        scoreLabel.fontColor = SKColor.black
        scoreLabel.text = "Score: " + String(game.score)
        playerHP.fontSize = 26
        playerHP.fontColor = SKColor.black
        playerHP.text = "Your Health: " + String(game.player.getCurrentHP())
        
        button1.position = CGPoint(x: xpos, y: ypos - 20)
        button2.position = CGPoint(x: 2 * xpos, y: ypos - 20)
        button3.position = CGPoint(x: 3 * xpos, y: ypos - 20)
        button4.position = CGPoint(x: 4 * xpos, y: ypos - 20)
        scoreLabel.position = CGPoint(x: xpos + 5 , y: ypos * 6 + 20)
        playerHP.position = CGPoint(x: 2 * xpos, y: ypos * 6 - 20)
        
        hud.addChild(button1)
        hud.addChild(button2)
        hud.addChild(button3)
        hud.addChild(button4)
        hud.addChild(scoreLabel)
        hud.addChild(playerHP)
        
        //Set Images
        background = createBackground()
        imageMonster = createMonster()
        
        //Add images to scene
        addChild(background)
        addChild(imageMonster)
        addChild(hud)
        
        
    }
    
    func getRandomIndex(array: [String]) -> Int {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: array.count)
        return randomNumber
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Loop over all the touches in this event
        for touch: AnyObject in touches {
            // Get the location of the touch in this scene
            let location = touch.location(in: self)
            // Check if the location of the touch is within the button's bounds
            if button1.contains(location) {
                print("tapped1!")
            }
            if button2.contains(location) {
                print("tapped2!")
            }
            if button3.contains(location) {
                print("tapped3!")
            }
            if button4.contains(location) {
                print("tapped4!")
            }
        }

    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
