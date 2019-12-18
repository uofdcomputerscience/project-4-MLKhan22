//
//  GameScene.swift
//  FinalProjectGame
//
//  Created by Minh Ly on 12/16/19.
//  Copyright © 2019 Minh Ly. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var score = 0
    var char:Character = Character()
    var down = SKSpriteNode()
    var up = SKSpriteNode()
    var right = SKSpriteNode()
    var left = SKSpriteNode()
    var X = SKSpriteNode()
    
    var energy = SKSpriteNode()
    var status = SKSpriteNode()
    
    var bg = SKSpriteNode()
    var leftB = SKSpriteNode()
    var rightB = SKSpriteNode()
    var ceilB = SKSpriteNode()
    var floorB = SKSpriteNode()
    
    var atlas = SKTextureAtlas()
    var standTextures = [SKTexture]()
    var walkTextures = [SKTexture]()
    var backTextures = [SKTexture]()
    var forwardTextures = [SKTexture]()
    
    var defAtlas = SKTextureAtlas()
    var defTextures = [SKTexture]()
    var defTextures2 = [SKTexture]()
    
    var chargeAtlas = SKTextureAtlas()
    var chargeTextures = [SKTexture]()
    
    var blastAtlas = SKTextureAtlas()
    var blastTextures1 = [SKTexture]()
    var blastTextures2 = [SKTexture]()
    var beamTextures1 = [SKTexture]()
    var beamTextures2 = [SKTexture]()
    
    var fullAtlas = SKTextureAtlas()
    
    var atkAtlas = SKTextureAtlas()
    var atkTextures = [SKTexture]()
    var jumpTextures = [SKTexture]()
    var fallTextures = [SKTexture]()
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        let fullAtlas = SKTextureAtlas(named: "GokuFull")
        let f1 = fullAtlas.textureNamed("sprite_goku11.png")
        let f3 = fullAtlas.textureNamed("sprite_goku13.png")
        let f4 = fullAtlas.textureNamed("sprite_goku14.png")
        
        let d1 = fullAtlas.textureNamed("sprite_goku04.png")
        let d2 = fullAtlas.textureNamed("sprite_goku05.png")
        
        let bl1 = fullAtlas.textureNamed("sprite_goku07.png")
        let bl2 = fullAtlas.textureNamed("sprite_goku08.png")
        
        let beam1 = fullAtlas.textureNamed("sprite_goku09.png")
        let beam2 = fullAtlas.textureNamed("sprite_goku10.png")
        
        let c1 = fullAtlas.textureNamed("sprite_goku01.png")
        let c2 = fullAtlas.textureNamed("sprite_goku02.png")
        let c3 = fullAtlas.textureNamed("sprite_goku03.png")
        
        let j1 = fullAtlas.textureNamed("sprite_goku18.png")
        let fall1 = fullAtlas.textureNamed("sprite_goku06.png")
        
        atkAtlas = SKTextureAtlas(named: "Blast")
        let atk1 = atkAtlas.textureNamed("sprite_blast0.png")
        let atk2 = atkAtlas.textureNamed("sprite_blast1.png")
        
        
        
        walkTextures.append(f1)
        walkTextures.append(f3)
        walkTextures.append(f4)
        
        standTextures.append(f1)
        backTextures.append(f4)
        forwardTextures.append(f3)
        
        defTextures.append(d1)
        defTextures2.append(d2)
        
        chargeTextures.append(c1)
        chargeTextures.append(c2)
        chargeTextures.append(c3)
        
        blastTextures1.append(bl1)
        blastTextures1.append(f1)
        blastTextures2.append(bl2)
        blastTextures2.append(f1)
        beamTextures1.append(beam1)
        beamTextures2.append(beam2)
        
        atkTextures.append(atk1)
        atkTextures.append(atk2)
        
        jumpTextures.append(j1)
        fallTextures.append(fall1)
        
        if let findChar:Character = self.childNode(withName: "character") as? Character {
            char = findChar
            char.position = CGPoint(x: -self.size.width/4, y: self.size.height/3)
            char.zPosition = 3
        }
        
        let scoreLabel = self.childNode(withName: "score") as! SKLabelNode
        status = self.childNode(withName: "status") as! SKSpriteNode
        energy = self.childNode(withName: "energy") as! SKSpriteNode
        X = self.childNode(withName: "X") as! SKSpriteNode
        down = self.childNode(withName: "down") as! SKSpriteNode
        up = self.childNode(withName: "up") as! SKSpriteNode
        right = self.childNode(withName: "right") as! SKSpriteNode
        left = self.childNode(withName: "left") as! SKSpriteNode
        bg = self.childNode(withName: "bg") as! SKSpriteNode
        leftB = self.childNode(withName: "leftBoundary") as! SKSpriteNode
        rightB = self.childNode(withName: "rightBoundary") as! SKSpriteNode
        ceilB = self.childNode(withName: "ceilingBoundary") as! SKSpriteNode
        floorB = self.childNode(withName: "floorBoundary") as! SKSpriteNode
        
        status.size = CGSize(width: self.size.width, height: 100)
        status.position = CGPoint(x: 0, y: self.size.height/10)
        energy.size = CGSize(width: self.size.width*2, height: 20)
        energy.position = CGPoint(x: -self.size.width/2, y: self.size.height/10)
        
        scoreLabel.position = CGPoint(x: energy.position.x, y: energy.position.y - 20)

        X.size = CGSize(width: 40, height: 50)
        X.position = CGPoint(x: self.size.width/4, y: -self.size.height/4)
       
        down.size = CGSize(width: 40, height: 60)
        down.position = CGPoint(x: -self.size.width/4, y: -self.size.height/4)
      
        up.size = CGSize(width: 40, height: 60)
        up.position = CGPoint(x: -self.size.width/4, y: -self.size.height/7)
      
        right.size = CGSize(width: 60, height: 40)
        right.position = CGPoint(x: -self.size.width/7, y: -self.size.height/5.1)

        left.size = CGSize(width: 60, height: 40)
        left.position = CGPoint(x: -self.size.width/2.9, y: -self.size.height/5.1)
        
        bg.size = CGSize(width: self.size.width, height: self.size.height/3)
        bg.position = CGPoint(x: 0, y: self.size.height/3)
        leftB.size = CGSize(width: 10, height: self.size.height/3)
        leftB.position = CGPoint(x: -self.size.width/2,y: self.size.height/3)
        rightB.size = CGSize(width: 10, height: self.size.height/3)
        rightB.position = CGPoint(x: self.size.width/2,y: self.size.height/3)
        ceilB.size = CGSize(width: 10, height: self.size.height)
        ceilB.position = CGPoint(x: 0,y: self.size.height/2)
        floorB.size = CGSize(width: 10, height: self.size.height)
        floorB.position = CGPoint(x: 0,y: self.size.height/4.5)
        
        
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        if nodeA.name == "atk" || nodeA.name == "beam" || nodeA.name == "beamHead" && nodeB.name != "bubble"{
            collisionBetween(atk: nodeA as! SKSpriteNode, object: nodeB as! SKSpriteNode)
        } else if nodeB.name == "atk" || nodeB.name == "beam" || nodeB.name == "beamHead" && nodeA.name != "bubble"{
            collisionBetween(atk: nodeB as! SKSpriteNode, object: nodeA as! SKSpriteNode)
        }
        
        if nodeA.name == "beam" || nodeA.name == "beamHead" {
            if( nodeB.name == "bubble" ){
                destroy(atk: nodeB as! SKSpriteNode)
                score+=1
            }
        } else if nodeB.name == "beam" || nodeB.name == "beamHead" {
            if( nodeA.name == "bubble" ){
                destroy(atk: nodeA as! SKSpriteNode)
                score+=1
            }
        }
        
        if nodeA.name == "atk" {
            if( nodeB.name == "bubble" ){
                destroy(atk: nodeA as! SKSpriteNode)
                destroy(atk: nodeB as! SKSpriteNode)
                score+=1
            }
        } else if nodeB.name == "atk" {
            if( nodeA.name == "bubble" ){
                destroy(atk: nodeA as! SKSpriteNode)
                destroy(atk: nodeB as! SKSpriteNode)
                score+=1
            }
        }
        if nodeA.name == "bubble" {
            if( nodeB.name != "atk" && nodeB.name != "beam" && nodeB.name != "beamHead"){
                destroy(atk: nodeA as! SKSpriteNode)
            }
        } else if nodeB.name == "bubble" {
            if( nodeA.name != "atk" && nodeA.name != "beam" && nodeA.name != "beamHead"){
                destroy(atk: nodeB as! SKSpriteNode)
            }
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)

        if let name = touchedNode.name
        {
            if char.beamAnim == 0{
                if name == "X" && char.charge == 0 && char.chargeVal == 0
                {
                    char.physicsBody!.velocity.dx = 0
                    char.charge = 1
                    char.chargeVal += 1
                }
                if name == "left" && char.charge == 0
                {
                    char.run(SKAction.repeatForever(SKAction.animate(with: backTextures, timePerFrame: 1)))
                    char.physicsBody!.velocity.dx = -70
                }
                if name == "right" && char.charge == 0
                {
                    char.run(SKAction.repeatForever(SKAction.animate(with: forwardTextures, timePerFrame: 1)))
                    char.physicsBody!.velocity.dx = 70
                }
                if name == "down" && char.def == 0
                {
                    char.run(SKAction.repeatForever(SKAction.animate(with: defTextures, timePerFrame: 1)))
                    char.def = 1
                }
                if (name == "X" || name == "down") && char.def == 1 && char.charge == 1 && char.jump == 0
                {
                    char.run(SKAction.repeatForever(SKAction.animate(with: chargeTextures, timePerFrame: 0.3)))
                    char.physicsBody!.velocity.dx = 0
                }
            }
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)

        if char.jump == 0 && char.beamAnim == 0
        {
            char.run(SKAction.repeatForever(SKAction.animate(with: standTextures, timePerFrame: 1)))
            char.physicsBody!.velocity.dx = 0
        }
        if let name = touchedNode.name
        {
            if char.beamAnim == 0{
                if name == "X" && char.chargeVal < 20 && (char.energy - 50) >= 0 && char.def == 0
                {
                    char.energy -= 50
                    if char.blast == 0{
                        char.blast = 1
                        char.blastAnim = 1
                        char.charge = 0
                        char.chargeVal = 0
                        char.run(SKAction.animate(with: blastTextures1, timePerFrame: 1, resize: true, restore: true))
                        let attack = SKSpriteNode(imageNamed: "sprite_blast0.png")
                        attack.run(SKAction.repeatForever(SKAction.animate(with: atkTextures, timePerFrame: 0.5)))
                        attack.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:3, height:3))
                        attack.name = "atk"
                        attack.zPosition = 3
                        attack.position = CGPoint(x: char.position.x + 5, y: char.position.y)
                        attack.physicsBody!.affectedByGravity = false
                        attack.physicsBody!.velocity.dx = 90
                        attack.physicsBody!.categoryBitMask = 4
                        attack.physicsBody!.collisionBitMask = 8
                        attack.physicsBody!.contactTestBitMask = 8
                        self.addChild(attack)
                        //char.size = CGSize(width: 20, height: 30)
                    }
                    else {
                        char.blast = 0
                        char.blastAnim = 1
                        char.charge = 0
                        char.chargeVal = 0
                        //char.size = CGSize(width: 50, height: 34)
                        char.run(SKAction.animate(with: blastTextures2, timePerFrame: 1, resize: true, restore: true))
                        let attack = SKSpriteNode(imageNamed: "sprite_blast0.png")
                        attack.run(SKAction.repeatForever(SKAction.animate(with: atkTextures, timePerFrame: 0.5)))
                        attack.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:3, height:3))
                        attack.name = "atk"
                        attack.zPosition = 3
                        attack.position = CGPoint(x: char.position.x + 5, y: char.position.y)
                        attack.physicsBody!.affectedByGravity = false
                        attack.physicsBody!.velocity.dx = 90
                        attack.physicsBody!.categoryBitMask = 4
                        attack.physicsBody!.collisionBitMask = 8
                        attack.physicsBody!.contactTestBitMask = 8
                        self.addChild(attack)
                        //char.size = CGSize(width: 20, height: 30)
                    }
                }
                if name == "X" && char.chargeVal >= 20 && (char.energy - 200) >= 0  && char.def == 0  && char.jump == 0
                {
                    char.energy -= 200
                    char.beamAnim = 1
                    char.charge = 0
                    char.chargeVal = 0
                    let beam = SKSpriteNode(imageNamed: "sprite_beam0.png")
                    let beamHead = SKSpriteNode(imageNamed: "sprite_beam1.png")
                    beam.anchorPoint = CGPoint(x: 0.0,y: 0.5)
                    beam.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:3, height:3))
                    beam.name = "beam"
                    beam.zPosition = 4
                    beam.position = CGPoint(x: char.position.x + 10, y: char.position.y-6)
                    beam.physicsBody!.affectedByGravity = false
                    beam.physicsBody!.categoryBitMask = 4
                    beam.physicsBody!.collisionBitMask = 8
                    beam.physicsBody!.contactTestBitMask = 8
                    beamHead.anchorPoint = CGPoint(x: 0.0,y: 0.5)
                    beamHead.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:5, height:5))
                    beamHead.name = "beamHead"
                    beamHead.zPosition = 5
                    beamHead.position = CGPoint(x: beam.position.x + beam.size.width-15, y: char.position.y-5)
                    beamHead.physicsBody!.affectedByGravity = false
                    beamHead.physicsBody!.categoryBitMask = 4
                    beamHead.physicsBody!.collisionBitMask = 8
                    beamHead.physicsBody!.contactTestBitMask = 8
                    self.addChild(beam)
                    self.addChild(beamHead)
                }
                if name == "left"
                {
                    char.texture = SKTexture(imageNamed: "sprite_goku11.png")
                    char.physicsBody!.velocity.dx = 0
                }
                if name == "right"
                {
                    char.texture = SKTexture(imageNamed: "sprite_goku11.png")
                    char.physicsBody!.velocity.dx = 0
                }
                if name == "up" && char.jump < 2
                {
                    char.blastAnim = 0
                    char.jump += 1
                    char.physicsBody!.velocity.dy = 400
                }
                if name == "down" && char.def == 1
                {
                    char.run(SKAction.repeatForever(SKAction.animate(with: standTextures, timePerFrame: 1)))
                    char.def = 0
                }
            }
            
            char.def = 0
            char.charge = 0
            char.chargeVal = 0
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        let scoreLabel = SKLabelNode(fileNamed: "score")
        scoreLabel!.text = String(score)
        let number = Int.random(in: 1 ..< 60)
        if number < 30 && children.count < 30{
            let bubble = SKSpriteNode(imageNamed: "sprite_bubble0.png")
            bubble.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:50, height:50))
            bubble.name = "bubble"
            bubble.zPosition = 6
            bubble.position = CGPoint(x: self.size.width, y: self.size.height/3)
            bubble.physicsBody!.affectedByGravity = false
            bubble.physicsBody!.velocity.dx = -50
            bubble.physicsBody!.velocity.dy = (CGFloat(number) - 15) * 3
            bubble.physicsBody!.categoryBitMask = 12
            bubble.physicsBody!.collisionBitMask = 32
            bubble.physicsBody!.contactTestBitMask = 32
            scene!.addChild(bubble)
        }
        energy.size = CGSize(width: self.size.width*CGFloat(Float(char.energy)/Float(char.maxE)), height: 20)
        if char.beamAnim == 1 && children.contains(where: { $0.name?.contains("beam") ?? false }) == false{
            char.run(SKAction.repeatForever(SKAction.animate(with: standTextures, timePerFrame: 1)))
            char.beamAnim = 0
        }
        else{
            if char.beamAnim == 1{
                char.run(SKAction.animate(with: beamTextures2, timePerFrame: 1))
                if let beam = scene?.childNode(withName: "beam") as? SKSpriteNode{
                    beam.size = CGSize(width: beam.size.width + 1, height: beam.size.height)
                    if let beamHead = scene?.childNode(withName: "beamHead") as? SKSpriteNode{
                        beamHead.position = CGPoint(x: beam.position.x + beam.size.width-15, y: char.position.y-5)
                    }
                    else{
                        destroy(atk: beam)
                    }
                }
            }
        }
        if char.beamAnim == 0{
            if char.charge == 1 && char.chargeVal < 20 && char.def == 0
            {
                char.chargeVal += 1
            }
            if char.chargeVal >= 20 && char.def == 0
            {
                char.run(SKAction.repeatForever(SKAction.animate(with: beamTextures1, timePerFrame: 1)))
            }
            if char.charge == 1 && char.def == 1 && char.energy < char.maxE && char.jump == 0
            {
                char.energy += 10
            }
            if char.texture!.description.contains("sprite_goku11") && char.blastAnim == 1 {
                char.blastAnim = 0
            }
            if char.physicsBody!.velocity.dy > 0 && char.jump > 0 && char.blastAnim == 0 {
                if char.def == 0
                {
                    char.run(SKAction.repeatForever(SKAction.animate(with: jumpTextures, timePerFrame: 1)))
                }
                if char.def == 1
                {
                    char.run(SKAction.repeatForever(SKAction.animate(with: defTextures2, timePerFrame: 1)))
                }
            }
            if char.physicsBody!.velocity.dy < 0 && char.jump > 0 && char.blastAnim == 0 {
                if char.def == 0
                {
                    char.run(SKAction.repeatForever(SKAction.animate(with: fallTextures, timePerFrame: 1)))
                }
                if char.def == 1
                {
                    char.run(SKAction.repeatForever(SKAction.animate(with: defTextures2, timePerFrame: 1)))
                }
            }
            if char.physicsBody!.velocity.dy == 0 && char.jump > 0{
                char.run(SKAction.repeatForever(SKAction.animate(with: standTextures, timePerFrame: 1)))
                char.jump = 0
            }
        }
    }
    
    func collisionBetween(atk: SKSpriteNode, object: SKSpriteNode) {
        if atk.name == "atk" || atk.name == "beam" || atk.name == "beamHead" || atk.name == "bubble"
        {
            destroy(atk: atk)
        }
    }

    func destroy(atk: SKSpriteNode) {
        atk.removeFromParent()
    }
}


