//
//  MYPlayer.swift
//  Ball
//
//  Created by 陈凯 on 16/1/14.
//  Copyright © 2016年 鸥！陈凯. All rights reserved.
//

import UIKit
import SpriteKit

class MYPlayer: SKSpriteNode {
    var player : Player = Player()
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
