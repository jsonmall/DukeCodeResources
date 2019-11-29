//
//  GameStartScene.swift
//  Ball
//
//  Created by 陈凯 on 16/1/7.
//  Copyright © 2016年 鸥！陈凯. All rights reserved.
//
import SpriteKit

class GameStartScene: SKScene {
    
    override func didMoveToView(view: SKView) {

        self.backgroundColor = UIColor.greenColor()
        let startLabel = SKLabelNode(fontNamed:"Chalkduster")
        startLabel.text = "Let's GO!!"
        startLabel.fontSize = 30
        startLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) - 100)
        self.addChild(startLabel)
        
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "点击！ 开始游戏 !"
        myLabel.fontSize = 40
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        self.addChild(myLabel)
        myLabel.name = "helloMyLabel"
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
//       self.view!.presentScene(GameLevel01Sence(fileNamed: "")!, transition: SKTransition.crossFadeWithDuration(0.6))
        
        if let helloLabel = self.childNodeWithName("helloMyLabel") as? SKLabelNode {
            helloLabel.name = nil
//            let moveDown = SKAction.moveByX(0, y: -100.0, duration: 0.5)
            let zoom   = SKAction.scaleTo(2.0, duration: 0.25)
            let pause  = SKAction.waitForDuration(0.5)
            let fadeAway = SKAction.fadeInWithDuration(0.25)
            let remove = SKAction.removeFromParent()
            let moveSequence = SKAction.sequence([zoom,pause,fadeAway,remove])
            helloLabel.runAction(moveSequence)
            helloLabel.runAction(moveSequence, completion: { () -> Void in
                let transition = SKTransition.doorsOpenVerticalWithDuration(0.6)
                self.view!.presentScene(GameLevel01Sence(size:self.view!.frame.size), transition: transition)
            })
        }
    }
    
    //
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
      
    }
    
    override func update(currentTime: NSTimeInterval) {
//        NSLog("%@", self)
//        NSLog("%@,%d", __FUNCTION__,__LINE__)
    }
}
