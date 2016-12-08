//
//  EndGameScene.swift
//  RNG Arena
//
//  Created by Hezekiah Valdez on 12/7/16.
//  Copyright © 2016 Hezekiah Valdez. All rights reserved.
//

import Foundation
import SpriteKit

class EndGame: SKScene {
    
    //Necessary default init
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    var scoreLabel = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
    var winOrLose = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
    var highscore = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
    
    var game = RAEngine.sharedInstance
    
    override init(size: CGSize) {
        
        super.init(size: size)
        
        //Position Ids
        let xcenter = self.size.width / 2
        let ypos = (self.size.height / 7)
        
        //Score label
        scoreLabel.fontSize = 30
        scoreLabel.fontColor = SKColor.white
        scoreLabel.text = "Score: " + String(game.score)
        scoreLabel.horizontalAlignmentMode = .center
        
        //Win or Lose label
        winOrLose.fontSize = 40
        winOrLose.fontColor = SKColor.white
        winOrLose.text = "You Lose"
        winOrLose.horizontalAlignmentMode = .center
        
        //Highscore label
        highscore.fontSize = 30
        highscore.fontColor = SKColor.white
        highscore.text = "Highscore: " + String(game.score)
        highscore.horizontalAlignmentMode = .center

        scoreLabel.position = CGPoint(x: xcenter, y: ypos * 4 + 15)
        winOrLose.position = CGPoint(x: xcenter, y: ypos * 6)
        highscore.position = CGPoint(x: xcenter, y: ypos * 4 - 15)
        
        addChild(scoreLabel)
        addChild(highscore)
        addChild(winOrLose)
        
    }
}
