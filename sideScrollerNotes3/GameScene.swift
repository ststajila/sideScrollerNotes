//
//  GameScene.swift
//  sideScrollerNotes3
//
//  Created by STANISLAV STAJILA on 2/22/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball: SKSpriteNode!
    var cam = SKCameraNode()
    
    override func didMove(to view: SKView) {
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        self.camera = cam
    }
    
    override func update(_ currentTime: TimeInterval) {
        cam.position.x = ball.position.x
        cam.position.y = ball.position.y - 50
        
    }
    
    func jump(){
        ball.physicsBody?.velocity.dy = 500
    }
    
}
