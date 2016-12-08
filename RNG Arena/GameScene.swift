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
    
    //Import XML game data
    var game = RAEngine.sharedInstance
    let levelData = RAEngine.sharedInstance.levelData
    var monsterNames: [String]!
    var abilityNames: [NSDictionary]!
    
    //Image definitions
    var background: SKNode!
    var imageMonster: SKSpriteNode!
    
    //HUD definitions with player score and enemy description
    var hud:SKNode = SKNode()
    var scoreLabel = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
    var playerHP = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
    var monsterName = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
    var monsterHP = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
    var actionLabel = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
    
    //Button definitions
    var button1: SKSpriteNode!
    var button2: SKSpriteNode!
    var button3: SKSpriteNode!
    var button4: SKSpriteNode!
    var button5: SKSpriteNode!
    var button6: SKSpriteNode!
    var button7: SKSpriteNode!

    //Save textures
    var image1: SKTexture!
    var image2: SKTexture!
    var image3: SKTexture!
    
    //State definitions
    var scaleFactor:CGFloat!
    var gameover = false
    var choosing = false
    var isDead = false
        
    //Required init because of override init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size:CGSize){
        super.init(size: size)
    
        scaleFactor = self.size.width / 320
        backgroundColor = SKColor(colorLiteralRed: 6/255, green: 150/255, blue: 35/255, alpha: 1)
        
        monsterNames = levelData?["MonsterNames"] as! [String]
        abilityNames = levelData?["AbilityNames"] as! [NSDictionary]
        
        
        game = RAEngine(monsterNames, abilityNames)
        game.getNewMonster()
        game.player.setPlayer()
        
        //Create HUD
        
        //Position Ids
        let xcenter = self.size.width / 2
        let xpos = self.size.width / 5
        let ypos = (self.size.height / 7)
        let HUDxpos = self.size.width / 10
        let HUDypos = self.size.height / 10
        
        button1 = createButton()
        button2 = createBlankButton()
        button3 = createBlankButton()
        button4 = createBlankButton()
        button5 = createButton()
        button6 = createButton()
        button7 = createButton()
        
        //Player score label
        scoreLabel.fontSize = 20
        scoreLabel.fontColor = SKColor.white
        scoreLabel.text = "Score: " + String(game.score)
        scoreLabel.horizontalAlignmentMode = .center
        
        //Player HP label
        playerHP.fontSize = 20
        playerHP.fontColor = SKColor.white
        playerHP.text = "Your Health: " + String(game.player.getCurrentHP())
        playerHP.horizontalAlignmentMode = .left
        
        //Monster Name Label
        monsterName.fontSize = 20
        monsterName.fontColor = SKColor.white
        monsterName.text = game.currentMonster.getName()
        monsterName.horizontalAlignmentMode = .center
        
        //Monster HP Label
        monsterHP.fontSize = 20
        monsterHP.fontColor = SKColor.white
        monsterHP.text = "Enemy Health: " + String(game.currentMonster.getCurrentHP())
        monsterHP.horizontalAlignmentMode = .center
        
        //Action Label
        actionLabel.fontSize = 20
        actionLabel.fontColor = SKColor.white
        actionLabel.text = "Test"
        actionLabel.horizontalAlignmentMode = .center
        
        //Set HUD positions
        button1.position = CGPoint(x: xpos, y: ypos - 20)
        button2.position = CGPoint(x: 2 * xpos, y: ypos - 20)
        button3.position = CGPoint(x: 3 * xpos, y: ypos - 20)
        button4.position = CGPoint(x: 4 * xpos, y: ypos - 20)
        button5.position = CGPoint(x: 1.5 * xpos, y: ypos - 20)
        button6.position = CGPoint(x: 3 * xpos, y: ypos - 20)
        button7.position = CGPoint(x: 4.5 * xpos, y: ypos - 20)

        scoreLabel.position = CGPoint(x: 2 * HUDxpos, y: HUDypos * 9)
        playerHP.position = CGPoint(x: 4 * HUDxpos, y: HUDypos * 9)
        monsterName.position = CGPoint(x: xcenter, y: (HUDypos * 8) + 10)
        monsterHP.position = CGPoint(x: xcenter, y: (HUDypos * 8) - 10)
        actionLabel.position = CGPoint(x: xcenter, y: ypos + 20)
        
        //Add all components to the HUD
        hud.addChild(button1)
        hud.addChild(button2)
        hud.addChild(button3)
        hud.addChild(button4)
        hud.addChild(scoreLabel)
        hud.addChild(playerHP)
        hud.addChild(monsterName)
        hud.addChild(monsterHP)
        hud.addChild(actionLabel)
        
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
            if button1.contains(location) && !button1.isHidden {
                game.dealDamage(true, 1)
                actionLabel.text = "You cast " + game.player.getAbility(number: 1).name + " for " + String(game.player.getAbility(number: 1).dmg)
                delay(delay: 2.0){
                    self.actionLabel.text = ""
                }
                
            }
            if button2.contains(location) && !button2.isHidden {
                game.dealDamage(true, 2)
            }
            if button3.contains(location) && !button3.isHidden {
                game.dealDamage(true, 3)
            }
            if button4.contains(location) && !button4.isHidden {
                game.dealDamage(true, 4)
                
            }
            
            if game.currentMonster.getCurrentHP() < 0 {
                
                isDead = true
                game.getNewMonster()
                game.score += 1
                
                //Update the UI
                scoreLabel.text = "Score: " + String(game.score)
                imageMonster.texture = resetMonster()
                monsterName.text = game.currentMonster.getName()
                
                
            }

            monsterHP.text = "Enemy Health: " + String(game.currentMonster.getCurrentHP())

            
        }

    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if (gameover){
            endGame()
        }
        if (isDead) {
            loot()
        }
        
        
        
    }
    
    func loot() {
        
        choosing = true
        
        button1.isHidden = true
        button2.isHidden = true
        button3.isHidden = true
        button4.isHidden = true
        
        
        
    }
    
    func endGame(){
        gameover = true
        game.saveGameStats()
        let transition = SKTransition.fade(withDuration: 0.5)
        let endGameScene = EndGame(size: self.size)
        self.view?.presentScene(endGameScene, transition: transition)
    }
    
    func delay(delay:Double, closure: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: .now() + delay ,
            execute: closure)
    }
}
