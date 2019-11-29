//
//  WaveView.swift
//  NoticeMe
//
//  Created by JMacMini on 16/5/18.
//  Copyright © 2016年 王俊仁. All rights reserved.
//

import UIKit

// MARK: - 波浪模型
class WaveModel {
    var offsetY: CGFloat = 0
    var width: CGFloat = 0
    var height: CGFloat = 0
    var skwing: CGFloat = 40
    var amplitude: CGFloat = 5
    var waveSpeed: CGFloat = 2
    
    init(offsetY oy: CGFloat = 0, width w: CGFloat = 0, height h: CGFloat = 0, skwing: CGFloat = 40, amplitude: CGFloat = 5, waveSpeed speed: CGFloat = 2) {
        self.offsetY   = oy
        self.width     = w
        self.height    = h
        self.skwing    = skwing
        self.amplitude = amplitude
        self.waveSpeed = speed
    }
}

// MARK: - WaveView
class WaveView: UIView {
    
    var waves = [CAShapeLayer]()
    var waveModels = [WaveModel]()
    var displayLink: CADisplayLink?
    
    var radian: CGFloat = 0
    
    var maxWaveWidth: CGFloat = CGFloat(MAXFLOAT)
    var waveMoveSkwing: CGFloat = 2
    var waveSpeed: CGFloat = 2
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - public method
    func clearWaves() {
        displayLink?.invalidate()
        displayLink = nil
        waves.forEach {$0.removeFromSuperlayer()}
        waves.removeAll()
        waveModels.removeAll()
    }
    
    func createWave(_ color: CGColor, offsetY: CGFloat = 0, waveWith width: CGFloat, height: CGFloat, skwing: CGFloat, amplitude: CGFloat, speed: CGFloat) {
        
        let wave = CAShapeLayer()
        wave.fillColor = color
        let model = WaveModel(offsetY: offsetY, width: width, height: height, skwing: skwing, amplitude: amplitude, waveSpeed: speed)
        
        wave.path = generatePath(model, radian: radian).cgPath
        
        waveModels.append(model)
        waves.append(wave)
        layer.addSublayer(wave)
        
        
    }
    
    func beginWave() {
        
        displayLink?.invalidate()
        displayLink = CADisplayLink(target: self, selector: #selector(WaveView.changingWavePath(_:)))
        displayLink?.add(to: RunLoop.main, forMode: RunLoopMode.commonModes)
        
    }
    func stopWave() {
        displayLink?.invalidate()
    }
    
    
    // MARK: - private method
    fileprivate func generatePath(_ waveModel: WaveModel, radian r: CGFloat) -> UIBezierPath {
        
        let path = UIBezierPath()
        let beginR = r
        let endR = waveModel.width + r
        
        func getYWith(_ r: CGFloat, waveModel: WaveModel) -> CGFloat {
            return sin(r / waveModel.skwing) * (cos(r / waveModel.skwing) * waveModel.amplitude) + waveModel.offsetY
        }
        
        path.move(to: CGPoint(x: 0, y: getYWith(beginR, waveModel: waveModel)))
        for i in Int(beginR+1)...Int(endR) {
            path.addLine(to: CGPoint(x: CGFloat(i - Int(beginR)), y: getYWith(CGFloat(i), waveModel: waveModel)))
        }
        path.addLine(to: CGPoint(x: waveModel.width, y: waveModel.height))
        path.addLine(to: CGPoint(x: 0, y: waveModel.height))
        path.addLine(to: CGPoint(x: 0, y: getYWith(beginR, waveModel: waveModel)))
        
        return path
    }
    
    
    
    @objc
    fileprivate func changingWavePath(_ link: CADisplayLink) {
        if self.superview == nil {
            link.invalidate()
            link.remove(from: RunLoop.main, forMode: RunLoopMode.commonModes)
            return
        }
        
        for (idx, ly) in waves.enumerated() {
            let model = waveModels[idx]
            ly.path = generatePath(model, radian: (radian * -model.waveSpeed)).cgPath
        }
        radian += 1
    }
    
}
