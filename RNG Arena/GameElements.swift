//
//  GameElements.swift
//  RNG Arena
//
//  Created by Hezekiah Valdez on 11/25/16.
//  Copyright © 2016 Hezekiah Valdez. All rights reserved.
//

import Foundation
import SpriteKit

//Class to delegate the creation of images and other functions to another unrelated class
extension GameScene {
    
    func createBackground() -> SKNode{
        
        let backgroundNode = SKNode()
        let spacing = 128 * scaleFactor
        
        let node = SKSpriteNode(imageNamed: "background")
        node.setScale(scaleFactor)
        node.anchorPoint = CGPoint(x: 0.5, y:0)
        node.position = CGPoint(x: self.size.width / 2, y: spacing)
        
        backgroundNode.addChild(node)
        
        return backgroundNode
    }
    
}
