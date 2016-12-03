//
//  Ability.swift
//  RNG Arena
//
//  Created by Hezekiah Valdez on 11/3/16.
//  Copyright © 2016 Hezekiah Valdez. All rights reserved.
//

import Foundation

public struct Ability {
    
    private var name: String
    private var dmg: Int
    
    public init(_ title: String, _ dmg: Int){
        self.name = title
        self.dmg = dmg
    }
    
    public init(){
        name = "blank"
        dmg = 0
    }
    
    //char1 deals damage to char2
    public func deal_damage(char1: Character){
        
        char1.take_damage(damage: dmg)
        
    }
    
}
