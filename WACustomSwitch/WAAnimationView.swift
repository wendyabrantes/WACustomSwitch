//
//  WAAnimationView.swift
//  WACustomSwitchExample
//
//  Created by Wendy Abrantes on 15/10/2015.
//  Copyright © 2015 ABRANTES DIGITAL LTD. All rights reserved.
//

import UIKit

class WAAnimationView: UIView {

    let kPopAnimationName = "popProgressAnimation"
    
    var animDuration : CFTimeInterval = 1.0
    var animationAdded: Bool = false
    var layerWithAnims : [CALayer]!
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //override and add your layers with animation
    func startAllAnimations(){

    }
    
    //override and add your layers
    func setupLayers(){
        self.userInteractionEnabled = false
    }
    
    let animatableProgress = POPAnimatableProperty.propertyWithName("progress") { (property: POPMutableAnimatableProperty!) -> Void in
        property.readBlock = { obj, values in
            values[0] = (obj as! WAAnimationView).progress
        }
        property.writeBlock = { obj, values in
            (obj as! WAAnimationView).progress = values[0]
        }
        property.threshold = 0.01
    } as! POPAnimatableProperty
    
    var progress: CGFloat = 0 {
        didSet{
            if(!self.animationAdded){
                startAllAnimations()
                self.animationAdded = true
                for layer in self.layerWithAnims{
                    layer.speed = 0
                    layer.timeOffset = 0
                }
             //   setNeedsDisplay()
            }
            else{
                let offset = progress * CGFloat(animDuration)
                for layer in self.layerWithAnims{
                    layer.timeOffset = CFTimeInterval(offset)
                }
            }
        }
    }
    
    func animateToProgress(progress: CGFloat){
        let animation = POPBasicAnimation()
        animation.property = animatableProgress
        animation.duration = 0.3
        animation.fromValue = self.progress
        animation.toValue = progress
        
        pop_addAnimation(animation, forKey: kPopAnimationName)
    }
    
    
}
