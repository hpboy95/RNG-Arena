//
//  RACharacter.swift
//  RNG Arena
//
//  Created by Hezekiah Valdez on 11/17/16.
//  Copyright © 2016 Hezekiah Valdez. All rights reserved.
//

import Foundation

//
//  Monster.swift
//  RNG Arena
//
//  Created by Hezekiah Valdez on 11/3/16.
//  Copyright © 2016 Hezekiah Valdez. All rights reserved.
//

import Foundation
import GameKit

public class Character{
    
    //Setting up a random level and basing remaining stats from random level
    private var level: Int
    private var hp: Int
    private var name: String
    private var ability1: Ability!
    private var ability2: Ability!
    private var ability3: Ability!
    private var ability4: Ability!
    
    //Blank Initializer for players
    init(){
        
        self.level = 0
        self.hp = 100
        self.name = "Chuck Norris"
        
    }
    
    //Basic initializer with name and abilities
    init(health:Int){
        
        let tmpNum = GKRandomDistribution(lowestValue: 1, highestValue: 10).nextInt()
        
        self.level = tmpNum
        self.hp = health * Int(tmpNum)
        self.name = ""
        
    }
    
    public func setName(_ name: String){
        self.name = name
    }
    
    public func getName() -> String {
        return name
    }
    
    //Deals damage by subtracting from current hp
    public func take_damage(skill: Ability, char: Character){
        
        skill.deal_damage(char1: char)
        
    }
    
    //Heals a unit by adding to the current hp
    public func modHP(num: Int){
        
        hp = hp - num
        
    }
    
    public func getCurrentHP() -> Int{
        return hp
    }
    
    public func getAbility(number: Int) -> Ability {
        switch number {
            case 1:
                return ability1
            case 2:
                return ability2
            case 3:
                return ability3
            case 4:
                return ability4
            default:
                return ability1
        }
    }
    
    public func setAbility(ability: Ability, number: Int){
        switch number {
        case 1:
            ability1 = ability
        case 2:
            ability2 = ability
        case 3:
            ability3 = ability
        case 4:
            ability4 = ability
        default:
            print(-1)
        }
        
    }

}
