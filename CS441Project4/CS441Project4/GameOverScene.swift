//
//  GameOverScene.swift
//  CS441Project4
//
//  Created by Jasper Suhr on 3/13/19.
//  Copyright © 2019 Jasper Suhr. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class GameOverScene: SKScene{
    let restart = SKLabelNode()
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "8bit")
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let gameOverLabel = SKLabelNode()
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 50
        gameOverLabel.fontColor = SKColor.white
        gameOverLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        gameOverLabel.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.7)
        gameOverLabel.zPosition = 1
        self.addChild(gameOverLabel)
        
        let scoreLabel = SKLabelNode()
        let numRemain = numEnemies - score
        scoreLabel.text = "Enemies Remaining: \(numRemain)"
        scoreLabel.fontSize = 40
        scoreLabel.fontColor = SKColor.white
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        scoreLabel.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        scoreLabel.zPosition = 1
        self.addChild(scoreLabel)
        
        restart.text = "Restart"
        restart.fontSize = 40
        restart.fontColor = SKColor.white
        restart.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        restart.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.3)
        restart.zPosition = 1
        self.addChild(restart)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch : AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            if restart.contains(pointOfTouch){
                let transition:SKTransition = SKTransition.fade(withDuration: 1)
                let sceneMoveTo = GameScene(size: self.size)
                self.view?.presentScene(sceneMoveTo, transition: transition)
            }
        }
    }
}

