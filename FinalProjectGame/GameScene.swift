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
    
    var viewController: UIViewController?
    
    var score = 0
    var char:Character = Character()
    var down = SKSpriteNode()
    var up = SKSpriteNode()
    var right = SKSpriteNode()
    var left = SKSpriteNode()
    var X = SKSpriteNode()
    var help = SKSpriteNode()
    
    var energy = SKSpriteNode()
    var over = SKSpriteNode()
    var status = SKSpriteNode()
    var scoreLabel: SKLabelNode!
    var stats: SKLabelNode!
    
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
    var sAtlas = SKTextureAtlas()
    
    var bubbleAtlas = SKTextureAtlas()
    var bubbleTextures = [SKTexture]()
    
    var atkAtlas = SKTextureAtlas()
    var atkTextures = [SKTexture]()
    var jumpTextures = [SKTexture]()
    var fallTextures = [SKTexture]()
    
    var standTexturesS = [SKTexture]()
    var walkTexturesS = [SKTexture]()
    var backTexturesS = [SKTexture]()
    var forwardTexturesS = [SKTexture]()
    var defTexturesS = [SKTexture]()
    var defTextures2S = [SKTexture]()
    var chargeTexturesS = [SKTexture]()
    var blastTextures1S = [SKTexture]()
    var blastTextures2S = [SKTexture]()
    var beamTextures1S = [SKTexture]()
    var beamTextures2S = [SKTexture]()
    var atkTexturesS = [SKTexture]()
    var jumpTexturesS = [SKTexture]()
    var fallTexturesS = [SKTexture]()
    
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
        
        bubbleAtlas = SKTextureAtlas(named: "Bubble")
        for i in 0...bubbleAtlas.textureNames.count-1{
            let Name = "sprite_bubble\(i).png"
            bubbleTextures.append(SKTexture(imageNamed: Name))
        }
        
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
        //blastTextures1.append(f1)
        blastTextures2.append(bl2)
        //blastTextures2.append(f1)
        beamTextures1.append(beam1)
        beamTextures2.append(beam2)
        
        atkTextures.append(atk1)
        atkTextures.append(atk2)
        
        jumpTextures.append(j1)
        fallTextures.append(fall1)
        
        let sAtlas = SKTextureAtlas(named: "GokuS")
        let sf1 = sAtlas.textureNamed("sprite_gokus14.png")
        let sf3 = sAtlas.textureNamed("sprite_gokus01.png")
        let sf4 = sAtlas.textureNamed("sprite_gokus02.png")
        
        let sd1 = sAtlas.textureNamed("sprite_gokus03.png")
        let sd2 = sAtlas.textureNamed("sprite_gokus13.png")
        
        let sbl1 = sAtlas.textureNamed("sprite_gokus05.png")
        let sbl2 = sAtlas.textureNamed("sprite_gokus06.png")
        
        let sbeam1 = sAtlas.textureNamed("sprite_gokus07.png")
        let sbeam2 = sAtlas.textureNamed("sprite_gokus08.png")
        
        let sc1 = sAtlas.textureNamed("sprite_gokus09.png")
        let sc2 = sAtlas.textureNamed("sprite_gokus10.png")
        let sc3 = sAtlas.textureNamed("sprite_gokus11.png")
        
        let sj1 = sAtlas.textureNamed("sprite_gokus04.png")
        let sfall1 = sAtlas.textureNamed("sprite_gokus12.png")
        
        let satk1 = atkAtlas.textureNamed("sprite_blasts0.png")
        let satk2 = atkAtlas.textureNamed("sprite_blasts1.png")
        
        
        walkTexturesS.append(sf1)
        walkTexturesS.append(sf3)
        walkTexturesS.append(sf4)
        
        standTexturesS.append(sf1)
        backTexturesS.append(sf4)
        forwardTexturesS.append(sf3)
        
        defTexturesS.append(sd1)
        defTextures2S.append(sd2)
        
        chargeTexturesS.append(sc1)
        chargeTexturesS.append(sc2)
        chargeTexturesS.append(sc3)
        
        blastTextures1S.append(sbl1)
        blastTextures2S.append(sbl2)
        beamTextures1S.append(sbeam1)
        beamTextures2S.append(sbeam2)
        
        atkTexturesS.append(satk1)
        atkTexturesS.append(satk2)
        
        jumpTexturesS.append(sj1)
        fallTexturesS.append(sfall1)
        
        if let findChar:Character = self.childNode(withName: "character") as? Character {
            char = findChar
            char.position = CGPoint(x: -self.size.width/4, y: self.size.height/3)
            char.zPosition = 3
        }
        
        
        status = self.childNode(withName: "status") as! SKSpriteNode
        energy = self.childNode(withName: "energy") as! SKSpriteNode
        over = self.childNode(withName: "over") as! SKSpriteNode
        help = self.childNode(withName: "help") as! SKSpriteNode
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
        over.size = CGSize(width: self.size.width*2, height: 20)
        over.position = CGPoint(x: -self.size.width/2, y: energy.position.y + CGFloat(5))
        
        scoreLabel = SKLabelNode(fontNamed: "Bebas")
        scoreLabel.name = "score"
        scoreLabel.text = "Score: 0"
        scoreLabel.fontColor = SKColor(red: 233/255, green: 157/255, blue: 20/255, alpha: 1)
        scoreLabel.position = CGPoint(x: 0, y: energy.position.y - 40)
        self.addChild(scoreLabel)
        
        stats = SKLabelNode(fontNamed: "Bebas")
        stats.fontSize = 10
        stats.name = "stats"
        stats.text = "Energy: 1000/1000  |  Multiplier: 1"
        stats.fontColor = SKColor(red: 233/255, green: 157/255, blue: 20/255, alpha: 1)
        stats.position = CGPoint(x: 0, y: energy.position.y + 30)
        self.addChild(stats)

        help.size = CGSize(width: 60, height: 60)
        help.position = CGPoint(x: self.size.width/3, y: -self.size.height/2.5)
        
        X.size = CGSize(width: 60, height: 60)
        X.position = CGPoint(x: self.size.width/4, y: -self.size.height/4.5)
       
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
    
    func showHelp(){
        self.viewController!.performSegue(withIdentifier: "help", sender: viewController)
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
                    char.physicsBody!.velocity.dx = CGFloat(Float(-70*char.speedMult))
                }
                if name == "right" && char.charge == 0
                {
                    char.run(SKAction.repeatForever(SKAction.animate(with: forwardTextures, timePerFrame: 1)))
                    char.physicsBody!.velocity.dx = CGFloat(Float(70*char.speedMult))
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
                        char.run(SKAction.animate(with: blastTextures1, timePerFrame: 1))
                        let attack = SKSpriteNode(imageNamed: "sprite_blast0.png")
                        attack.run(SKAction.repeatForever(SKAction.animate(with: atkTextures, timePerFrame: 0.5)))
                        attack.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:3, height:3))
                        attack.name = "atk"
                        attack.zPosition = 3
                        attack.position = CGPoint(x: char.position.x + CGFloat(char.blastOffset), y: char.position.y)
                        attack.physicsBody!.affectedByGravity = false
                        attack.physicsBody!.velocity.dx = CGFloat(Float(90*char.speedMult))
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
                        char.run(SKAction.animate(with: blastTextures2, timePerFrame: 1))
                        let attack = SKSpriteNode(imageNamed: "sprite_blast0.png")
                        attack.run(SKAction.repeatForever(SKAction.animate(with: atkTextures, timePerFrame: 0.5)))
                        attack.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:3, height:3))
                        attack.name = "atk"
                        attack.zPosition = 3
                        attack.position = CGPoint(x: char.position.x + CGFloat(char.blastOffset), y: char.position.y)
                        attack.physicsBody!.affectedByGravity = false
                        attack.physicsBody!.velocity.dx = CGFloat(Float(90*char.speedMult))
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
                    beam.position = CGPoint(x: char.position.x + CGFloat(char.beamOffset), y: char.position.y-6)
                    beam.physicsBody!.affectedByGravity = false
                    beam.physicsBody!.isDynamic = false
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
                if name == "help"
                {
                    showHelp()
                }
            }
            
            char.def = 0
            char.charge = 0
            char.chargeVal = 0
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if char.energy > char.maxE
        {
            char.energy = char.maxE
        }
        if scoreLabel!.text != nil
        {
            scoreLabel.text = "Score: " + String(score)
        }
        if stats!.text != nil
        {
            stats.text = "Energy: "+String(char.energy)+"/"+String(char.maxE)+" | Multiplier: "+String(char.speedMult)
        }

        let number = Int.random(in: 1 ..< 60)
        if number < 30 && children.count < 30{
            let bubble = SKSpriteNode(imageNamed: "sprite_bubble0.png")
            bubble.run(SKAction.repeatForever(SKAction.animate(with: bubbleTextures, timePerFrame: 0.3)))
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
        if char.over >= char.maxE
        {
            char.transform = 1
            char.over = 0
        }
        if char.transform == 1
        {
            walkTextures = walkTexturesS
            
            standTextures = standTexturesS
            backTextures = backTexturesS
            forwardTextures = forwardTexturesS
            
            defTextures = defTexturesS
            defTextures2 = defTextures2S
            
            chargeTextures = chargeTexturesS
            
            blastTextures1 = blastTextures1S
            blastTextures2 = blastTextures2S
            beamTextures1 = beamTextures1S
            beamTextures2 = beamTextures2S
            
            atkTextures = atkTexturesS
            
            jumpTextures = jumpTexturesS
            fallTextures = fallTexturesS
            
            char.run(SKAction.repeatForever(SKAction.animate(with: chargeTextures, timePerFrame: 0.3)))
            if( char.maxE < 5000){
                char.maxE += 500
            }
            if( char.speedMult < 3.0){
                char.speedMult += 0.2
                let round = Double(String(format: "%.1f", ceil(char.speedMult*100)/100))
                char.speedMult = round!
            }
            if char.chargeRate < 20{
                char.chargeRate += 5
            }
            char.beamOffset = 30
            char.transform = 2
        }
        energy.size = CGSize(width: self.size.width*CGFloat(Float(char.energy)/Float(char.maxE)), height: 20)
        over.size = CGSize(width: self.size.width*CGFloat(Float(char.over)/Float(char.maxE)), height: 20)
        if char.beamAnim == 1 && children.contains(where: { $0.name?.contains("beam") ?? false }) == false{
            char.run(SKAction.repeatForever(SKAction.animate(with: standTextures, timePerFrame: 1)))
            char.beamAnim = 0
        }
        else{
            if char.beamAnim == 1{
                char.run(SKAction.animate(with: beamTextures2, timePerFrame: 1))
                if let beam = scene?.childNode(withName: "beam") as? SKSpriteNode{
                    beam.size = CGSize(width: beam.size.width + CGFloat(Float(1*char.speedMult)), height: beam.size.height)
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
            if char.charge == 1 && char.def == 1 && char.jump == 0
            {
                if char.energy < char.maxE
                {
                    char.energy += char.chargeRate
                }
                if char.energy >= char.maxE && char.over < char.maxE
                {
                    char.over += char.chargeRate
                }
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
    
    func transform(){
        
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


