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
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        backgroundColor = .orange
        
        let ground = SKTexture.init(cgImage: #imageLiteral(resourceName: "Cyclopes") as! CGImage)
        
        let page = SKSpriteNode.init(texture: ground, size: CGSize(width: 30, height: 40))
        
        page.position = view.center
        addChild(page)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
