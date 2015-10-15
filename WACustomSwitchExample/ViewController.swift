//
//  ViewController.swift
//  WACustomSwitchExample
//
//  Created by Wendy Abrantes on 05/10/2015.
//  Copyright © 2015 ABRANTES DIGITAL LTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let nativeSwitch = WACustomSwitch(frame: CGRect(x:100, y:44, width:60, height:35), animationType: AnimationType.NativeAnimation)
        view.addSubview(nativeSwitch)
        
        let customSwitch = WACustomSwitch(frame: CGRect(x:100, y:144, width:100, height:50), animationType: AnimationType.DayNightAnimation)
        view.addSubview(customSwitch)
        //add value changed target
        customSwitch.addTarget(self, action: Selector("toggleValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
    }

    func toggleValueChanged(toggle: WACustomSwitch){
        NSLog("value updated %@", toggle.on)    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

