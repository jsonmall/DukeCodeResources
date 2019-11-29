//
//  GameViewController.swift
//  Ball
//
//  Created by 陈凯 on 16/1/7.
//  Copyright (c) 2016年 鸥！陈凯. All rights reserved.
//

import UIKit
import SpriteKit
class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let startScene = GameLevel01Sence(size:self.view!.frame.size)
          let startScene = GameStartScene(size:self.view!.frame.size)
        //  Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.showsDrawCount = true
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            startScene.scaleMode = .AspectFill

            skView.presentScene(startScene)

    }


    
    class func getListPlayDataWithIndex(index: NSInteger, result:(model: NSString,error: NSError?) ->Void) -> Void{
    }
    func shouldStepToScene(sceneName : String) {
        
    }
    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
