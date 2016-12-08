//
//  Engine.swift
//  RNG Arena
//
//  Created by Hezekiah Valdez on 11/1/16.
//  Copyright © 2016 Hezekiah Valdez. All rights reserved.
//

import Foundation
import GameKit

class RAEngine{
    
    var score: Int
    var highScore: Int
    var currentMonster: Monster!
    var player: Player!
    var levelData: NSDictionary!
    var monsterNames: [String]!
    var abilityNames: [NSDictionary]!
    
    class var sharedInstance: RAEngine {
        
        struct Singleton{
            static let instance = RAEngine()
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
                levelData = monster
            }
        }
    }
    
    init(_ monsterNames: [String], _ abilityNames: [NSDictionary]){
        score = 0
        highScore = 0
        self.monsterNames = monsterNames
        self.abilityNames = abilityNames
        player = Player(abilityData: abilityNames)
        
        let userDefaults = UserDefaults.standard
        
        highScore = userDefaults.integer(forKey: "highScore")
        
        if let path = Bundle.main.path(forResource: "Data", ofType: "plist"){
            if let monster = NSDictionary(contentsOfFile: path){
                levelData = monster
            }
        }
        
    }
    
    func dealDamage(_ isPlayer: Bool,_ abilityNumber: Int) {
        switch isPlayer {
        case true:
            let tmp = player.getAbility(number: abilityNumber)
            player.take_damage(skill: tmp, char: currentMonster)
        default:
            let tmp = currentMonster.getAbility(number: abilityNumber)
            currentMonster.take_damage(skill: tmp, char: player)
        }
    }
    
    func saveGameStats(){
        
        highScore = max(score, highScore)
        
        let userDefaults =  UserDefaults.standard
        userDefaults.set(highScore, forKey: "highScore")
        
        userDefaults.synchronize()
        
    }

    func getNewMonster(){
        currentMonster = Monster(names: monsterNames, abilityData: abilityNames)
        currentMonster.setMonster()
    }
    
    func addAbility(skill: Ability, num: Int){
        player.setAbility(ability: skill, number: num)
    }
    
    func chooseThree() -> [Ability] {
        
        var selectArray = [Ability]()
        var count = 0
        while count < 3 {
            
            let rand1 = GKRandomDistribution(lowestValue: 0, highestValue: abilityNames.count - 1).nextInt()

            let data1 = abilityNames[rand1]
            
            let ability1 = Ability(data1.object(forKey: "Name") as! String, data1.object(forKey: "Damage") as! Int)
            selectArray.append(ability1)
            
            count += 1

        }
        
        return selectArray
        
    }
    
}
