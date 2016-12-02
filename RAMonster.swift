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
    
    let levelData = RAEngine.sharedInstance.levelData

    override init(){
        super.init(health: 0, name: "blah")
    }
}
