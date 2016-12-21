//
//  GameScene.swift
//  Flappy Ship
//
//  Created by PJ on 12/18/16.
//  Copyright © 2016 PJ. All rights reserved.
//

import SpriteKit
import GameplayKit

struct PhysicsCtrl {
    static let ship: UInt32 = 0x1 << 1
    static let ground: UInt32 = 0x1 << 2
    static let ceiling: UInt32 = 0x1 << 3
    static let wall: UInt32 = 0x1 << 4
}

class GameScene: SKScene {
    
    var ship = SKSpriteNode()
    var ground = SKSpriteNode()
    var ceiling = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        /* Ship setup */
        ship = SKSpriteNode(imageNamed: "power_sprite")
        ship.size = CGSize(width: 60, height: 70)
        ship.position = CGPoint(x: self.frame.width / 2 - ship.frame.width, y: self.frame.height / 2)
        ship.zRotation = CGFloat(-M_PI_2)
        ship.zPosition = 2
        // Set up phyiscs for ship
        ship.physicsBody = SKPhysicsBody(rectangleOf: ship.size)
        ship.physicsBody?.categoryBitMask = PhysicsCtrl.ship
        ship.physicsBody?.collisionBitMask = PhysicsCtrl.ceiling | PhysicsCtrl.ground | PhysicsCtrl.wall
        ship.physicsBody?.contactTestBitMask = PhysicsCtrl.ceiling | PhysicsCtrl.ground
            | PhysicsCtrl.wall
        ship.physicsBody?.affectedByGravity = true
        ship.physicsBody?.isDynamic = true
        
        self.addChild(ship)
        
        /*  Ground set up */
        ground = SKSpriteNode(imageNamed: "ground")
        ground.setScale(1.1)
        ground.position = CGPoint(x: 350, y: 0 + ground.frame.height / 2)
        ground.zPosition = 3
        // Set up physics for ground
        ground.physicsBody = SKPhysicsBody(rectangleOf: ground.size)
        ground.physicsBody?.categoryBitMask = PhysicsCtrl.ground
        ground.physicsBody?.collisionBitMask = PhysicsCtrl.ship
        ground.physicsBody?.contactTestBitMask = PhysicsCtrl.ship
        ground.physicsBody?.affectedByGravity = false
        ground.physicsBody?.isDynamic = false
        
        self.addChild(ground)
        
        /* Ceiling setup */
        ceiling = SKSpriteNode(imageNamed: "ground")
        ceiling.setScale(1.2)
        ceiling.position = CGPoint(x: 350, y: self.frame.height - 40)
        ceiling.zPosition = 3
        // Set up physics for ceiling
        ceiling.physicsBody = SKPhysicsBody(rectangleOf: ceiling.size)
        ceiling.physicsBody?.categoryBitMask = PhysicsCtrl.ceiling
        ceiling.physicsBody?.collisionBitMask = PhysicsCtrl.ship
        ceiling.physicsBody?.contactTestBitMask = PhysicsCtrl.ship
        ceiling.physicsBody?.affectedByGravity = false
        ceiling.physicsBody?.isDynamic  = false
        
        self.addChild(ceiling)
        
        // Call to function to make two walls
        makeWalls()
        
    }
    
    /* Function that creates a pair of walls for the ship to dodge */
    func makeWalls() {
        let wallPair = SKNode()
        
        /*  Set up top wall */
        let tWall = SKSpriteNode(imageNamed: "ground")
        tWall.position = CGPoint(x: self.frame.width, y: self.frame.height / 2 + 410)
        tWall.setScale(0.9)
        tWall.zRotation = CGFloat(M_PI_2)
        // Top wall physics
        tWall.physicsBody = SKPhysicsBody(rectangleOf: tWall.size)
        tWall.physicsBody?.categoryBitMask = PhysicsCtrl.wall
        tWall.physicsBody?.collisionBitMask = PhysicsCtrl.ship
        tWall.physicsBody?.contactTestBitMask = PhysicsCtrl.ship
        tWall.physicsBody?.affectedByGravity = false
        tWall.physicsBody?.isDynamic = false
        wallPair.addChild(tWall)
        
        /* Set up bottom wall */
        let bWall = SKSpriteNode(imageNamed: "ground")
        bWall.position = CGPoint(x: self.frame.width, y: self.frame.height / 2 - 410)
        bWall.setScale(0.9)
        bWall.zRotation = CGFloat(M_PI_2)
        // Bottom wall physics
        bWall.physicsBody = SKPhysicsBody(rectangleOf: bWall.size)
        bWall.physicsBody?.categoryBitMask = PhysicsCtrl.wall
        bWall.physicsBody?.collisionBitMask = PhysicsCtrl.ship
        bWall.physicsBody?.contactTestBitMask = PhysicsCtrl.ship
        bWall.physicsBody?.affectedByGravity = false
        bWall.physicsBody?.isDynamic = false
        wallPair.addChild(bWall)
        
        wallPair.zPosition = 1
        self.addChild(wallPair)
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Actually setting the touch to move ship up */
        ship.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        ship.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 70))
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
