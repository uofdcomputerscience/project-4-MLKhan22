//
//  Character.swift
//  FinalProjectGame
//
//  Created by Minh Ly on 12/17/19.
//  Copyright © 2019 Minh Ly. All rights reserved.
//
import SpriteKit
import GameplayKit

class Character: SKSpriteNode {
    var transform = 0
    
    var blastOffset = 5
    var blastAnim = 0
    var beamOffset = 20
    var beamAnim = 0
    var blast = 0
    
    var charge = 0
    var def = 0
    
    var chargeVal = 0
    
    var jump = 1
    
    var maxE = 1000
    var energy = 1000
    var over = 0
    
    var speedMult:Double = 1.0
    
    var chargeRate = 10
    
}
