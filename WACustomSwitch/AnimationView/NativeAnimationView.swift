//
//  NativeAnimationView.swift
//  WACustomSwitchExample
//
//  Created by Wendy Abrantes on 15/10/2015.
//  Copyright © 2015 ABRANTES DIGITAL LTD. All rights reserved.
//

import UIKit

class NativeAnimationView: WAAnimationView {

    //default
    var width : CGFloat = 60
    var height : CGFloat = 35
    
    let thumbInset : CGFloat = 0
    
    var strokeColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
    var selectedColor = UIColor(red: 111/255.0, green: 216/255.0, blue: 100/255.0, alpha: 1.0)
    
    // MARK: VARIABLE DECLARARION
    var strokeBackgroundLayer : CAShapeLayer = CAShapeLayer()
    var backgroundLayer : CAShapeLayer = CAShapeLayer()
    var thumbLayer : CAShapeLayer = CAShapeLayer()
    
    
    // MARK: SETUP LAYER AND ANIMATION 
    
    //TODO OVERRIDE SETUPLAYERS AND ADD YOUR LAYER
    override func setupLayers() {
        super.setupLayers()
        
        width = self.frame.width
        height = self.frame.height
        
        strokeBackgroundLayer.path = backgroundPath(CGRect(x: 0,y: 0,width: width,height: height), radius: 50/2).CGPath
        strokeBackgroundLayer.strokeColor = strokeColor.CGColor
        strokeBackgroundLayer.fillColor = selectedColor.CGColor
        strokeBackgroundLayer.lineWidth = 2
        
        backgroundLayer.path = backgroundPath(CGRect(x: 1,y: 1,width: width-2,height: height-2), radius: 50/2).CGPath
        backgroundLayer.fillColor = UIColor.whiteColor().CGColor
        
        thumbLayer.path = UIBezierPath(ovalInRect: CGRect(x: thumbInset/2, y: thumbInset/2, width: height-thumbInset, height: height-thumbInset)).CGPath
        thumbLayer.strokeColor = strokeColor.CGColor
        thumbLayer.fillColor = UIColor.whiteColor().CGColor
        thumbLayer.lineWidth = 0.5
        thumbLayer.shadowColor = UIColor.blackColor().CGColor
        thumbLayer.shadowOpacity = 0.2
        thumbLayer.shadowRadius = 1
        thumbLayer.shadowOffset = CGSizeMake(0, 1)
        
        layer.addSublayer(strokeBackgroundLayer)
        layer.addSublayer(backgroundLayer)
        layer.addSublayer(thumbLayer)
        
        //ADD YOUR LAYER WITH ANIMATION TO THE ARRAY
        self.layerWithAnims = [strokeBackgroundLayer, backgroundLayer, thumbLayer]
    }
    
    //TODO OVERRIDE START ALL ANIMATION
    override func startAllAnimations() {
        super.startAllAnimations()
        
        //TODO ADD YOUR LAYER ANIMATION
        strokeBackgroundLayer.addAnimation(strokeBackgroundAnimations(), forKey: "strokeBackgroundAnimations")
        backgroundLayer.addAnimation(backgroundAnimations(), forKey: "backgroundAnimations")
        thumbLayer.addAnimation(thumbAnimations(), forKey: "thumbAnimations")
    }
    
    // MARK: ANIMATION LAYERS

    // MARK: STROKE
    func strokeBackgroundAnimations() -> CAAnimationGroup {
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = animDuration
        groupAnimation.animations = [strokeColorAnimation(), strokeFillColorAnimation()]
        groupAnimation.removedOnCompletion = false;
        
        return groupAnimation
    }
    
    func strokeColorAnimation()-> CABasicAnimation {
        
        let strokeAnim = CABasicAnimation(keyPath: "strokeColor")
        strokeAnim.fromValue = strokeColor.CGColor
        strokeAnim.toValue = selectedColor.CGColor
        strokeAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        return strokeAnim
    }
    func strokeFillColorAnimation()-> CABasicAnimation {
        
        let fillAnim = CABasicAnimation(keyPath: "fillColor")
        fillAnim.fromValue = UIColor.whiteColor().CGColor
        fillAnim.toValue = selectedColor.CGColor
        fillAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        return fillAnim
    }
    
    // MARK: BACKGROUND
    func backgroundAnimations() -> CAAnimationGroup {
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = animDuration
        groupAnimation.animations = [backgroundFillAnimation()]
        groupAnimation.removedOnCompletion = false;
        
        return groupAnimation
    }
    
    func backgroundFillAnimation()-> CAKeyframeAnimation {

        let endPath = backgroundPath(CGRect(x: 1, y: 1, width: width-2, height: height-2), radius: 0)
        let beginPath = backgroundPath(CGRect(x: width/2, y: height/2, width: 0, height: 0), radius: 0)
        
        let fillAnim = CAKeyframeAnimation(keyPath: "path")
        fillAnim.values = [
            endPath.CGPath,
            beginPath.CGPath]
        
        fillAnim.keyTimes  = [
            NSNumber(float: 0.0),
            NSNumber(float: 1.0)]

        fillAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        return fillAnim
    }

    func backgroundPath(frame: CGRect, radius: CGFloat) -> UIBezierPath {
        //// Rectangle Drawing

        let rectanglePath = UIBezierPath(roundedRect: CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: frame.height), cornerRadius: frame.height/2)
        return rectanglePath
    }

    // MARK: THUMB
    func thumbAnimations() -> CAAnimationGroup {
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = animDuration
        groupAnimation.animations = [thumbPositionAnimation()]
        groupAnimation.removedOnCompletion = false;
        
        return groupAnimation
    }
    
    func thumbPositionAnimation()-> CABasicAnimation {

        let posAnim = CABasicAnimation(keyPath: "position")
        posAnim.fromValue = NSValue(CGPoint:CGPointMake(0, 0))
        posAnim.toValue = NSValue(CGPoint:CGPointMake( (width - height), 0))
        posAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        return posAnim
    }
    
    
    
    
    
    
}
