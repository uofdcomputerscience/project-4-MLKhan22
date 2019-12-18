//
//  GameViewController.swift
//  FinalProjectGame
//
//  Created by Minh Ly on 12/16/19.
//  Copyright © 2019 Minh Ly. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var SKViewSize: CGSize?
    var SKViewSizeRect: CGRect?
    var helpView: HelpView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
//            let skView = self.view as! SKView
//            SKViewSize = skView.bounds.size
//            let scene = GameScene(size: SKViewSize!)
            if let scene = GameScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                //scene.scaleMode = .aspectFill
                // Present the scene
                scene.viewController = self
                view.presentScene(scene)
            }
//            scene.scaleMode = .aspectFill
//            skView.presentScene(scene)
//            SKViewSizeRect = getViewSizeRect()
            
            view.ignoresSiblingOrder = false
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    func getViewSizeRect() -> CGRect {
        return CGRect(x: ((SKViewSize!.width  * 0.5) * -1.0), y: ((SKViewSize!.height * 0.5) * -1.0), width: SKViewSize!.width, height: SKViewSize!.height)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
