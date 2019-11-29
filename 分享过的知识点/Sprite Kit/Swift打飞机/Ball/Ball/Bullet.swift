//
//  Bullet.swift
//  Ball
//
//  Created by 陈凯 on 16/1/14.
//  Copyright © 2016年 鸥！陈凯. All rights reserved.
//

import SpriteKit

class Bullet: NSObject {

    var frame : String
    var offset : String
    var rotated : Bool
    var sourceColorRect : String
    var sourceSize : String
    
    var texture : SKTexture?
    
    var frameValue : CGRect {
        set {
            self.frame = NSStringFromCGRect(frameValue)
        }
        get {
            return CGRectFromString(self.frame)
        }
    }
    var offsetValue : CGPoint {
        set {
            self.frame = NSStringFromCGPoint(offsetValue)
        }
        get {
            return CGPointFromString(self.offset)
        }
    }
    var sourceColorRectValue : CGRect {
        set {
            self.frame = NSStringFromCGRect(sourceColorRectValue)
        }
        get {
            return CGRectFromString(self.sourceColorRect)
        }
    }
    var sourceSizeValue : CGSize {
        set {
            self.frame = NSStringFromCGSize(sourceSizeValue)
        }
        get {
            return CGSizeFromString(self.sourceSize)
        }
    }
    override init() {
        self.texture = SKTexture()
        self.rotated = false
        self.frame = ""
        self.offset = ""
        self.sourceColorRect = ""
        self.sourceSize = ""
        super.init()
    }
    init(fm : String, ot : String, r : Bool, scr : String, ssize : String) {
        self.rotated = r
        self.frame = fm
        self.offset = ot
        self.sourceColorRect = scr
        self.sourceSize = ssize
        super.init()
    }
}
