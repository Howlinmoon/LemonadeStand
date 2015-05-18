//
//  Supplies.swift
//  LemonadeStand
//
//  Created by jim Veneskey on 5/18/15.
//  Copyright (c) 2015 Jim Veneskey. All rights reserved.
//

import Foundation

struct Supplies {
    // money, lemons, ice cubes
    var money = 0
    var lemons = 0
    var iceCubes = 0
    
    // custom initializer
    init (aMoney: Int, aLemons : Int, aIceCubes: Int) {
        money = aMoney
        lemons = aLemons
        iceCubes = aIceCubes
    }
}