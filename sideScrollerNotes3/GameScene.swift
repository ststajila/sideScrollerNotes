//
//  GameScene.swift
//  sideScrollerNotes3
//
//  Created by STANISLAV STAJILA on 2/22/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var ball: SKSpriteNode!
    var cam = SKCameraNode()
    var scoreLabel: SKLabelNode!
    var score = 0
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        self.camera = cam
        scoreLabel = self.childNode(withName: "scoreLabel") as! SKLabelNode
        scoreLabel.text = "Score: \(score)"
    }
    
    override func update(_ currentTime: TimeInterval) {
        cam.position.x = ball.position.x
        cam.position.y = ball.position.y - 50
        scoreLabel.position.x = cam.position.x - 300
        scoreLabel.position.y = cam.position.y + 100
        
        if ball.position.y < -480{
            
            respawn()
            
        }
            
        }
        
    
    func jump(){
        ball.physicsBody?.velocity.dy = 500
    }
    
    //function gets called when cotakt happens
    func didBegin(_ contact: SKPhysicsContact) {
        
        if (contact.bodyA.node?.name == "ball" && contact.bodyB.node?.name == "coin") || (contact.bodyA.node?.name == "coin" && contact.bodyB.node?.name == "ball"){
            print("hit")
            score += 1
            scoreLabel.text = "Score: \(score)"
            if contact.bodyA.node?.name == "coin"{
                contact.bodyA.node?.removeFromParent()
                ball.physicsBody?.velocity.dx = 500
            }
            if contact.bodyB.node?.name == "coin"{
                contact.bodyB.node?.removeFromParent()
                ball.physicsBody?.velocity.dx = 500
            }
        }
        
    }
    
    func respawn(){
        ball.position.x = -450
        ball.position.y = 50
    }
    
}
