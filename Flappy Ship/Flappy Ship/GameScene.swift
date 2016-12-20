//
//  GameScene.swift
//  Flappy Ship
//
//  Created by PJ on 12/18/16.
//  Copyright © 2016 PJ. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ship = SKSpriteNode()
    var ground = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        /* Get ship and put it on screen */ 
        ship = SKSpriteNode(imageNamed: "power_sprite")
        ship.setScale(0.35)
        ship.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        self.addChild(ship)
        
        /* Get ground image and put it on the screen */
        ground = SKSpriteNode(imageNamed: "ground")
        ground.setScale(1.1)
        ground.position = CGPoint(x: 350, y: 0 + ground.frame.height / 2)
        self.addChild(ground)
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
