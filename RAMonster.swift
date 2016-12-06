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
        
        let name = names[getRandomIndex(array: names as NSArray)]
        
        let data1 = abilityData[getRandomIndex(array: abilityData as NSArray)]
        let data2 = abilityData[getRandomIndex(array: abilityData as NSArray)]
        let data3 = abilityData[getRandomIndex(array: abilityData as NSArray)]
        let data4 = abilityData[getRandomIndex(array: abilityData as NSArray)]
        
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
    
    func getRandomIndex(array: NSArray) -> Int {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: array.count)
        return randomNumber
    }
    
    
}
