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
    
    var currentData: NSDictionary!
    
    class var sharedInstance: Engine {
        
        struct Singleton{
            static let instance = Engine()
        }
        
        return Singleton.instance
        
    }
    
    
    init(){
        score = 0
        highScore = 0
        
        let userDefaults = UserDefaults.standard
        
        highScore = userDefaults.integer(forKey: "highScore")
        
        if let path = Bundle.main.path(forResource: "Data", ofType: "plist"){
            if let monster = NSDictionary(contentsOfFile: path){
                currentData = monster
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
