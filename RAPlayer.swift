//
//  RAPlayer.swift
//  RNG Arena
//
//  Created by Hezekiah Valdez on 11/17/16.
//  Copyright © 2016 Hezekiah Valdez. All rights reserved.
//

import Foundation
import GameKit

public class Player: Character {
    
    var abilityData: [NSDictionary]
    
    
    init(abilityData: [NSDictionary] ) {
    
        self.abilityData = abilityData
        super.init()
        
    }
    
    func setPlayer() {
        
        let rand1 = GKRandomDistribution(lowestValue: 0, highestValue: abilityData.count - 1).nextInt()
    
        let data1 = abilityData[rand1]
        
        let ability1 = Ability(data1.object(forKey: "Name") as! String, data1.object(forKey: "Damage") as! Int)
        
        setAbility(ability: ability1, number: 1)
        setAbility(ability: Ability(), number: 2)
        setAbility(ability: Ability(), number: 3)
        setAbility(ability: Ability(), number: 4)
        
    }
   
    
}
