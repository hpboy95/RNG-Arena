//
//  Engine.swift
//  RNG Arena
//
//  Created by Hezekiah Valdez on 11/1/16.
//  Copyright © 2016 Hezekiah Valdez. All rights reserved.
//

import Foundation

class RAEngine{
    
    var score: Int
    var highScore: Int
    var currentMonster: Monster!
    var player = Player(health: 100)
    var levelData: NSDictionary!
    
    //        let monsterNames = levelData?["MonsterNames"] as![String]
    //        let abilityNames = levelData?["AbilityNames"] as! [String]
    
    class var sharedInstance: RAEngine {
        
        struct Singleton{
            static let instance = RAEngine()
        }
        
        return Singleton.instance
        
    }
    
    
    init(){
        score = 0
        highScore = 0
        currentMonster = Monster()
        
        let userDefaults = UserDefaults.standard
        
        highScore = userDefaults.integer(forKey: "highScore")
        
        if let path = Bundle.main.path(forResource: "Data", ofType: "plist"){
            if let monster = NSDictionary(contentsOfFile: path){
                levelData = monster
            }
        }
        
    }
    
    func saveGameStats(){
        
        highScore = max(score, highScore)
        
        let userDefaults =  UserDefaults.standard
        userDefaults.set(highScore, forKey: "highScore")
        
        userDefaults.synchronize()
        
    }

    
}
