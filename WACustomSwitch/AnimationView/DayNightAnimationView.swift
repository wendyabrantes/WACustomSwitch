//
//  DayNightAnimationLayer.swift
//  WACustomSwitchExample
//
//  Created by Wendy Abrantes on 06/10/2015.
//  Copyright © 2015 ABRANTES DIGITAL LTD. All rights reserved.
//

import UIKit

class DayNightAnimationView : WAAnimationView {
   
    let thickness : CGFloat  = 4.0

    var backgroundLayer : CAShapeLayer!
    var starsLayer : CAShapeLayer!
    var topStrokeLayer : CAShapeLayer!
    
    var cloudLayer : CAShapeLayer!
    
    var thumb : CAShapeLayer!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }
    
    override func setupLayers(){
        super.setupLayers()
        backgroundColor = UIColor.clearColor()
        
        backgroundLayer = CAShapeLayer()

        let backgroundPath = UIBezierPath(roundedRect: CGRectMake(0, 0, bounds.width, bounds.height), cornerRadius: bounds.height/2)
        backgroundLayer.path = backgroundPath.CGPath;
        backgroundLayer.strokeColor = DayNightStyleKit.blue2.CGColor
        backgroundLayer.fillColor = DayNightStyleKit.gray3.CGColor
        backgroundLayer.lineWidth = 4

        topStrokeLayer = CAShapeLayer()
        topStrokeLayer.transform = CATransform3DMakeRotation(-1.57079633, 0.0, 0.0, 1.0)
        topStrokeLayer.frame = CGRectMake(0, 0, bounds.width, bounds.height)
        
        let topPath = UIBezierPath(roundedRect: CGRectMake(0, 0, bounds.height, bounds.width), cornerRadius: bounds.height/2)

        topStrokeLayer.path = topPath.CGPath;
        topStrokeLayer.strokeStart = 0.0
        topStrokeLayer.strokeEnd = 1.0
        topStrokeLayer.strokeColor = DayNightStyleKit.gray4.CGColor
        topStrokeLayer.fillColor = UIColor.clearColor().CGColor
        topStrokeLayer.lineWidth = thickness
        
        cloudLayer = CAShapeLayer();
        cloudLayer.frame = CGRectMake( (bounds.width - 40)/2 , (bounds.height - 40)/2 , 40, 40)
        cloudLayer.path = drawCloud(frame: CGRectMake(0, 0, 40, 40)).CGPath
        cloudLayer.transform = CATransform3DMakeScale(0.0, 0.0, 0.0)
        cloudLayer.strokeColor = DayNightStyleKit.gray2.CGColor
        cloudLayer.fillColor = DayNightStyleKit.white.CGColor
        cloudLayer.lineWidth = thickness

        thumb = CAShapeLayer()
        let thumbSize = bounds.height - (thickness*2)
        thumb.frame = CGRectMake(thickness,thickness,thumbSize,thumbSize)
        let rectangle2Path = UIBezierPath(roundedRect: CGRectMake(0, 0, thumbSize, thumbSize), cornerRadius: bounds.height/2)
        thumb.path = rectangle2Path.CGPath
        thumb.fillColor = DayNightStyleKit.white.CGColor
        thumb.strokeColor = DayNightStyleKit.gray1.CGColor
        thumb.lineWidth = thickness

        self.layer.addSublayer(backgroundLayer)
        self.layer.addSublayer(topStrokeLayer)
        //self.layer.addSublayer(starsLayer)
        self.layer.addSublayer(thumb)
        self.layer.addSublayer(cloudLayer)
        
        layerWithAnims = [backgroundLayer, thumb, topStrokeLayer, cloudLayer]
    }
    
    //MARK STARS
    func drawStars(frame frame: CGRect = CGRectMake(0, 0, 44, 44)) -> UIBezierPath{
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(frame.minX + 35.5, frame.minY + 11.75))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 33.75, frame.minY + 13.5), controlPoint1: CGPointMake(frame.minX + 35.5, frame.minY + 12.72), controlPoint2: CGPointMake(frame.minX + 34.72, frame.minY + 13.5))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 32, frame.minY + 11.75), controlPoint1: CGPointMake(frame.minX + 32.78, frame.minY + 13.5), controlPoint2: CGPointMake(frame.minX + 32, frame.minY + 12.72))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 33.75, frame.minY + 10), controlPoint1: CGPointMake(frame.minX + 32, frame.minY + 10.78), controlPoint2: CGPointMake(frame.minX + 32.78, frame.minY + 10))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 35.5, frame.minY + 11.75), controlPoint1: CGPointMake(frame.minX + 34.72, frame.minY + 10), controlPoint2: CGPointMake(frame.minX + 35.5, frame.minY + 10.78))
        bezierPath.closePath()
        bezierPath.moveToPoint(CGPointMake(frame.minX + 39, frame.minY + 26))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 37, frame.minY + 28), controlPoint1: CGPointMake(frame.minX + 39, frame.minY + 27.1), controlPoint2: CGPointMake(frame.minX + 38.1, frame.minY + 28))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 35, frame.minY + 26), controlPoint1: CGPointMake(frame.minX + 35.9, frame.minY + 28), controlPoint2: CGPointMake(frame.minX + 35, frame.minY + 27.1))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 37, frame.minY + 24), controlPoint1: CGPointMake(frame.minX + 35, frame.minY + 24.9), controlPoint2: CGPointMake(frame.minX + 35.9, frame.minY + 24))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 39, frame.minY + 26), controlPoint1: CGPointMake(frame.minX + 38.1, frame.minY + 24), controlPoint2: CGPointMake(frame.minX + 39, frame.minY + 24.9))
        bezierPath.closePath()
        bezierPath.moveToPoint(CGPointMake(frame.minX + 7.5, frame.minY + 5.25))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 5.25, frame.minY + 7.5), controlPoint1: CGPointMake(frame.minX + 7.5, frame.minY + 6.49), controlPoint2: CGPointMake(frame.minX + 6.49, frame.minY + 7.5))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 3, frame.minY + 5.25), controlPoint1: CGPointMake(frame.minX + 4.01, frame.minY + 7.5), controlPoint2: CGPointMake(frame.minX + 3, frame.minY + 6.49))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 5.25, frame.minY + 3), controlPoint1: CGPointMake(frame.minX + 3, frame.minY + 4.01), controlPoint2: CGPointMake(frame.minX + 4.01, frame.minY + 3))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 7.5, frame.minY + 5.25), controlPoint1: CGPointMake(frame.minX + 6.49, frame.minY + 3), controlPoint2: CGPointMake(frame.minX + 7.5, frame.minY + 4.01))
        bezierPath.closePath()
        bezierPath.moveToPoint(CGPointMake(frame.minX + 16, frame.minY + 14.5))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 14.5, frame.minY + 16), controlPoint1: CGPointMake(frame.minX + 16, frame.minY + 15.33), controlPoint2: CGPointMake(frame.minX + 15.33, frame.minY + 16))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 13, frame.minY + 14.5), controlPoint1: CGPointMake(frame.minX + 13.67, frame.minY + 16), controlPoint2: CGPointMake(frame.minX + 13, frame.minY + 15.33))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 14.5, frame.minY + 13), controlPoint1: CGPointMake(frame.minX + 13, frame.minY + 13.67), controlPoint2: CGPointMake(frame.minX + 13.67, frame.minY + 13))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 16, frame.minY + 14.5), controlPoint1: CGPointMake(frame.minX + 15.33, frame.minY + 13), controlPoint2: CGPointMake(frame.minX + 16, frame.minY + 13.67))
        bezierPath.closePath()
        bezierPath.moveToPoint(CGPointMake(frame.minX + 12.5, frame.minY + 27.75))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 11.75, frame.minY + 28.5), controlPoint1: CGPointMake(frame.minX + 12.5, frame.minY + 28.16), controlPoint2: CGPointMake(frame.minX + 12.16, frame.minY + 28.5))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 11, frame.minY + 27.75), controlPoint1: CGPointMake(frame.minX + 11.34, frame.minY + 28.5), controlPoint2: CGPointMake(frame.minX + 11, frame.minY + 28.16))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 11.75, frame.minY + 27), controlPoint1: CGPointMake(frame.minX + 11, frame.minY + 27.34), controlPoint2: CGPointMake(frame.minX + 11.34, frame.minY + 27))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 12.5, frame.minY + 27.75), controlPoint1: CGPointMake(frame.minX + 12.16, frame.minY + 27), controlPoint2: CGPointMake(frame.minX + 12.5, frame.minY + 27.34))
        bezierPath.closePath()
        bezierPath.moveToPoint(CGPointMake(frame.minX + 26, frame.minY + 34.5))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 23.5, frame.minY + 37), controlPoint1: CGPointMake(frame.minX + 26, frame.minY + 35.88), controlPoint2: CGPointMake(frame.minX + 24.88, frame.minY + 37))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 21, frame.minY + 34.5), controlPoint1: CGPointMake(frame.minX + 22.12, frame.minY + 37), controlPoint2: CGPointMake(frame.minX + 21, frame.minY + 35.88))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 23.5, frame.minY + 32), controlPoint1: CGPointMake(frame.minX + 21, frame.minY + 33.12), controlPoint2: CGPointMake(frame.minX + 22.12, frame.minY + 32))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 26, frame.minY + 34.5), controlPoint1: CGPointMake(frame.minX + 24.88, frame.minY + 32), controlPoint2: CGPointMake(frame.minX + 26, frame.minY + 33.12))
        bezierPath.closePath()
        bezierPath.moveToPoint(CGPointMake(frame.minX + 26, frame.minY + 21))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 25, frame.minY + 22), controlPoint1: CGPointMake(frame.minX + 26, frame.minY + 21.55), controlPoint2: CGPointMake(frame.minX + 25.55, frame.minY + 22))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 24, frame.minY + 21), controlPoint1: CGPointMake(frame.minX + 24.45, frame.minY + 22), controlPoint2: CGPointMake(frame.minX + 24, frame.minY + 21.55))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 25, frame.minY + 20), controlPoint1: CGPointMake(frame.minX + 24, frame.minY + 20.45), controlPoint2: CGPointMake(frame.minX + 24.45, frame.minY + 20))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 26, frame.minY + 21), controlPoint1: CGPointMake(frame.minX + 25.55, frame.minY + 20), controlPoint2: CGPointMake(frame.minX + 26, frame.minY + 20.45))
        bezierPath.closePath()
        DayNightStyleKit.white.setFill()
        bezierPath.fill()
        return bezierPath
    }

    //MARK CLOUD
    func drawCloud(frame frame: CGRect = CGRectMake(0, 0, 44, 44)) -> UIBezierPath {
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        UIColor.blackColor().setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()
        
        
        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.moveToPoint(CGPointMake(frame.minX + 34.17, frame.minY + 20.64))
        bezier2Path.addCurveToPoint(CGPointMake(frame.minX + 33.64, frame.minY + 20.64), controlPoint1: CGPointMake(frame.minX + 34, frame.minY + 20.64), controlPoint2: CGPointMake(frame.minX + 33.82, frame.minY + 20.64))
        bezier2Path.addCurveToPoint(CGPointMake(frame.minX + 26.19, frame.minY + 15.45), controlPoint1: CGPointMake(frame.minX + 32.58, frame.minY + 17.53), controlPoint2: CGPointMake(frame.minX + 29.56, frame.minY + 15.45))
        bezier2Path.addCurveToPoint(CGPointMake(frame.minX + 25.83, frame.minY + 15.45), controlPoint1: CGPointMake(frame.minX + 26.01, frame.minY + 15.45), controlPoint2: CGPointMake(frame.minX + 25.83, frame.minY + 15.45))
        bezier2Path.addCurveToPoint(CGPointMake(frame.minX + 18.2, frame.minY + 12), controlPoint1: CGPointMake(frame.minX + 24.06, frame.minY + 13.38), controlPoint2: CGPointMake(frame.minX + 21.39, frame.minY + 12))
        bezier2Path.addCurveToPoint(CGPointMake(frame.minX + 8.44, frame.minY + 20.64), controlPoint1: CGPointMake(frame.minX + 13.05, frame.minY + 12), controlPoint2: CGPointMake(frame.minX + 8.97, frame.minY + 15.8))
        bezier2Path.addCurveToPoint(CGPointMake(frame.minX + 4, frame.minY + 25.82), controlPoint1: CGPointMake(frame.minX + 5.95, frame.minY + 20.98), controlPoint2: CGPointMake(frame.minX + 4, frame.minY + 23.23))
        bezier2Path.addCurveToPoint(CGPointMake(frame.minX + 9.32, frame.minY + 31), controlPoint1: CGPointMake(frame.minX + 4, frame.minY + 28.75), controlPoint2: CGPointMake(frame.minX + 6.31, frame.minY + 31))
        bezier2Path.addLineToPoint(CGPointMake(frame.minX + 34.17, frame.minY + 31))
        bezier2Path.addCurveToPoint(CGPointMake(frame.minX + 39.5, frame.minY + 25.82), controlPoint1: CGPointMake(frame.minX + 37.19, frame.minY + 31), controlPoint2: CGPointMake(frame.minX + 39.5, frame.minY + 28.75))
        bezier2Path.addCurveToPoint(CGPointMake(frame.minX + 34.17, frame.minY + 20.64), controlPoint1: CGPointMake(frame.minX + 39.5, frame.minY + 22.88), controlPoint2: CGPointMake(frame.minX + 37.19, frame.minY + 20.64))
        bezier2Path.closePath()
        bezier2Path.miterLimit = 4;
        
        DayNightStyleKit.white.setFill()
        bezier2Path.fill()
        DayNightStyleKit.gray2.setStroke()
        bezier2Path.lineWidth = 4
        bezier2Path.stroke()
        
        return bezier2Path
    }

    func cloudAnimations() -> CAAnimationGroup {
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = animDuration
        groupAnimation.animations = [cloudScaleAnimation()]
        groupAnimation.removedOnCompletion = false;
        
        return groupAnimation
    }
    
    func cloudScaleAnimation()-> CAKeyframeAnimation {
        
        let strokeAnim = CAKeyframeAnimation(keyPath: "transform.scale")
        strokeAnim.values = [NSNumber(float: 0.0),
            NSNumber(float: 0.0),
            NSNumber(float: 1.1),
            NSNumber(float: 0.8)]
        strokeAnim.keyTimes  = [NSNumber(float: 0.0),
            NSNumber(float: 0.0),
            NSNumber(float: 0.8),
            NSNumber(float: 1.0)
        ]
        strokeAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        return strokeAnim
    }
    
    // MARK - ANIMATION
    override func startAllAnimations(){
        super.startAllAnimations()
        backgroundLayer.addAnimation(backgroundAnimations(), forKey:"backgroundAnimation")
        topStrokeLayer.addAnimation(topStrokeAnimations(), forKey: "topStrokeAnimation")
        //starsLayer.addAnimation(starsAnimations(), forKey: "starsAnimation")
        thumb.addAnimation(thumbAnimations(), forKey:"thumbAnimation")
        cloudLayer.addAnimation(cloudAnimations(), forKey: "cloudAnimation")

    }

    // : MARK - BACKGROUND
    func backgroundAnimations() -> CAAnimationGroup {
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = animDuration
        groupAnimation.animations = [backgroundFillColorAnimation()]
        groupAnimation.removedOnCompletion = false
        return groupAnimation
    }
    
    func backgroundFillColorAnimation()-> CAKeyframeAnimation {
        
        let fillingAnim = CAKeyframeAnimation(keyPath: "fillColor")
        fillingAnim.values = [DayNightStyleKit.gray3.CGColor,
                    DayNightStyleKit.blue1.CGColor,
                    DayNightStyleKit.blue1.CGColor];
        fillingAnim.keyTimes  = [NSNumber(float: 0.0),
            NSNumber(float: 0.3),
            NSNumber(float: 1.0)
        ]
        return fillingAnim
    }
    
    
    // : MARK - TOP STROKE
    func topStrokeAnimations() -> CAAnimationGroup {
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = animDuration
        groupAnimation.animations = [topStrokePathAnimation(), topStrokeColourAnimation()]
        groupAnimation.removedOnCompletion = false
        return groupAnimation
    }
    

    func topStrokeColourAnimation()-> CABasicAnimation {
        
        let strokeAnim = CABasicAnimation(keyPath: "strokeColor")
        strokeAnim.fromValue = DayNightStyleKit.gray4.CGColor
        strokeAnim.toValue   = UIColor.clearColor().CGColor
        return strokeAnim
    }
    
    func topStrokePathAnimation()-> CAKeyframeAnimation {

        let strokeAnim = CAKeyframeAnimation(keyPath: "strokeStart")
        strokeAnim.values = [NSNumber(float: 0.0),
            NSNumber(float: 1.0),
            NSNumber(float: 1.0)]
        strokeAnim.keyTimes  = [NSNumber(float: 0.0),
                NSNumber(float: 0.8),
                NSNumber(float: 1.0)
            ]
        return strokeAnim
    }
    
    // MARK - THUMB
    func thumbAnimations() -> CAAnimationGroup {
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = animDuration
        groupAnimation.removedOnCompletion = false
        groupAnimation.animations = [thumbPositionAnimation(), thumbColorAnimation(), thumbFillColorAnimation()]
        
        return groupAnimation
    }
    
    func thumbPositionAnimation()-> CABasicAnimation {
        let positionAnim = CABasicAnimation(keyPath: "position")
        positionAnim.fromValue = NSValue(CGPoint: CGPointMake(thickness + thumb.bounds.width/2, bounds.height/2));
        positionAnim.toValue   = NSValue(CGPoint: CGPointMake((self.bounds.width - thickness) - thumb.bounds.width/2, bounds.height/2));
        return positionAnim
    }

    func thumbColorAnimation()-> CABasicAnimation {
        let positionAnim = CABasicAnimation(keyPath: "strokeColor")
        positionAnim.fromValue = DayNightStyleKit.gray1.CGColor
        positionAnim.toValue   = DayNightStyleKit.yellow2.CGColor
        return positionAnim
    }
    
    func thumbFillColorAnimation()-> CABasicAnimation {
        let positionAnim = CABasicAnimation(keyPath: "fillColor")
        positionAnim.fromValue = DayNightStyleKit.white.CGColor
        positionAnim.toValue   = DayNightStyleKit.yellow1.CGColor
        
        return positionAnim
    }
    
    func thumbOpacityAnimation()-> CABasicAnimation {
        let positionAnim = CABasicAnimation(keyPath: "opacity")
        positionAnim.fromValue = NSNumber(float: 1.0)
        positionAnim.toValue   = NSNumber(float: 0.0)
        
        return positionAnim
    }
}