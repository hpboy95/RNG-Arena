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
    
    //HUD definitions with player score and enemy description
//    var hud:SKNode
//    var scoreLabel:SKLabelNode!
//    var title:SKLabelNode
    
    //Button definitions
    var button1 = SKSpriteNode(imageNamed: "Blank")
    var button2 = SKSpriteNode(imageNamed: "Blank")
    var button3 = SKSpriteNode(imageNamed: "Blank")
    var button4 = SKSpriteNode(imageNamed: "Blank")

    //State definitions
    var scaleFactor:CGFloat!
    var player = Player(health: GKRandomDistribution(lowestValue: 50, highestValue: 100).nextInt())
    var gameOver = false
    
    //Required init because of override init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size:CGSize){
        super.init(size: size)
    
        scaleFactor = self.size.width / 320
        backgroundColor = SKColor(colorLiteralRed: 6/255, green: 150/255, blue: 35/255, alpha: 1)
        
        background = createBackground()
        addChild(background)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
