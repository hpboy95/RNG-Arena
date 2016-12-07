//
//  Monster.swift
//  RNG Arena
//
//  Created by Hezekiah Valdez on 11/3/16.
//  Copyright © 2016 Hezekiah Valdez. All rights reserved.
//

import Foundation
import GameKit

public class Monster: Character {
    
    var names: [String]
    var abilityData: [NSDictionary]
    
    
    init(names: [String], abilityData: [NSDictionary] ) {
    
        self.names = names
        self.abilityData = abilityData
        super.init()
    
    }
    
    func setMonster() {
        
        let rand1 = GKRandomDistribution(lowestValue: 0, highestValue: abilityData.count).nextInt()
        let rand2 = GKRandomDistribution(lowestValue: 0, highestValue: abilityData.count).nextInt()
        let rand3 = GKRandomDistribution(lowestValue: 0, highestValue: abilityData.count).nextInt()
        let rand4 = GKRandomDistribution(lowestValue: 0, highestValue: abilityData.count).nextInt()
        let rand5 = GKRandomDistribution(lowestValue: 0, highestValue: names.count).nextInt()
        
        let name = names[rand5]
        
        
        
        let data1 = abilityData[rand1]
        let data2 = abilityData[rand2]
        let data3 = abilityData[rand3]
        let data4 = abilityData[rand4]
        
        let ability1 = Ability(data1.object(forKey: "Name") as! String, data1.object(forKey: "Damage") as! Int)
        let ability2 = Ability(data2.object(forKey: "Name") as! String, data2.object(forKey: "Damage") as! Int)
        let ability3 = Ability(data3.object(forKey: "Name") as! String, data3.object(forKey: "Damage") as! Int)
        let ability4 = Ability(data4.object(forKey: "Name") as! String, data4.object(forKey: "Damage") as! Int)
        
        setName(name)
        setAbility(ability: ability1, number: 1)
        setAbility(ability: ability2, number: 2)
        setAbility(ability: ability3, number: 3)
        setAbility(ability: ability4, number: 4)
        
    }
    
    
    
    
}
