//
//  Monster.swift
//  RNG Arena
//
//  Created by Hezekiah Valdez on 11/3/16.
//  Copyright © 2016 Hezekiah Valdez. All rights reserved.
//

import Foundation

public class Monster {
    
    //Initial attributes
    private var hp: Int
    private var name: String
    private var abilities = [String: Ability]()
    
    //Basic initializer with name and abilities
    init(health:Int, name: String){
        
        self.hp = health
        self.name = name
        
    }
    
    //Deals damage by subtracting from current hp
    public func take_damage(damage: Int){
        
        hp = hp - damage
        
    }
    
    //Heals a unit by adding to the current hp
    public func heal(heal: Int){
        
        hp = hp + heal
        
    }
    
    //Adds to the Dictionary of abilities
    public func add_ability(skill: Ability, name: String){
        
        abilities[name] = Ability
        
    }

    
    
    
}
