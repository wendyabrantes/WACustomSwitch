//
//  WACustomSwitch.swift
//  WACustomSwitchExample
//
//  Created by Wendy Abrantes on 05/10/2015.
//  Copyright © 2015 ABRANTES DIGITAL LTD. All rights reserved.
//

import UIKit

enum AnimationType{
    case NativeAnimation
    case DayNightAnimation
    
    func animationView(frame:CGRect) -> WAAnimationView {
        switch self {
        case .DayNightAnimation:
            return DayNightAnimationView(frame: frame);
        case .NativeAnimation:
            return NativeAnimationView(frame: frame);
        }
    }
}

class WACustomSwitch: UIControl {

    var on: Bool = false
    var isTapGesture: Bool = false
    
    var animationView : WAAnimationView!
    var _previousTouchPoint:CGPoint!
   
    
    init(frame: CGRect, animationType : AnimationType) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clearColor()
        animationView = animationType.animationView(CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        animationView.userInteractionEnabled = false
        addSubview(animationView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        isTapGesture = true
        _previousTouchPoint = touch.locationInView(self)
        
        let percent : CGFloat = _previousTouchPoint.x / self.frame.width
        animationView.animateToProgress(percent)
        
        return true
        
    }
    
    override func continueTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        isTapGesture = false
        animationView.pop_removeAllAnimations()
        let currentTouch = touch.locationInView(self)
        
        var percent : CGFloat = currentTouch.x / self.frame.width
        percent = max(percent, 0.0)
        percent = min(percent, 1.0)
        animationView.progress = percent
        animationView.setNeedsDisplay()

        return true
    }
    
    override func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        if(isTapGesture){
            if(self.on){
                animationView.animateToProgress(0.0)
            }else{
                animationView.animateToProgress(1.0)
            }
            self.on = !self.on
        }else{
            endToggleAnimation()
        }
    }
    
    override func cancelTrackingWithEvent(event: UIEvent?) {
        if(isTapGesture){
            if(self.on){
                animationView.animateToProgress(0.0)
            }else{
                animationView.animateToProgress(1.0)
            }
            self.on = !self.on
        }else{
         endToggleAnimation()   
        }
    }
    
    func endToggleAnimation(){
        
        var newProgress : CGFloat!
        if(animationView.progress >= 0.5)
        {
            newProgress = 1.0
            animationView.animateToProgress(newProgress)
        }else{
            newProgress = 0.0
            animationView.animateToProgress(newProgress)
        }
        
        if(on && newProgress == 0)
        {
            on = false
            sendActionsForControlEvents(UIControlEvents.ValueChanged)
        }else if(!on && newProgress == 1){
            on = true
            sendActionsForControlEvents(UIControlEvents.ValueChanged)
        }
        
    }
    
    func setOn(on: Bool, animated: Bool){

        var progress : CGFloat = 0.0
        if on {
            progress = 1.0
        }
        if(animated){
            animationView.animateToProgress(progress)
        }else{
            animationView.progress = progress
        }
    }
    


}
