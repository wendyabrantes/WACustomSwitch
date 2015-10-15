# WACustomSwitch
www.iostuts.io

WACustomSwitch is custom component that allow user to create complex switch animation.

![alt tag](https://raw.githubusercontent.com/wendyabrantes/WACustomSwitch/master/WACustomSwitch.gif)

## Requirements
* Xcode 7 or higher
* Apple LLVM compiler
* iOS 8.0 or higher (May work on previous versions, I just didnt test on it, feel free to edit)
* ARC
* Pod 

## Demo

Open and run the WACustomSwitchExample workspace in Xcode to see WACustomSwitch in action. The example a native look switch and day and night. 

## Installation

### Cocoapods

Install Cocoapods if it is not installed yet:

``` bash
$ [sudo] gem install cocoapods
$ pod setup
```

Add WATokenFieldView to Podfile:

``` bash
pod 'WACustomSwitch'
```

Call 'pod install':

``` bash
pod install
```

### Manual install

You will need to drop WACustomView folder into your project and include headers. 
This project also requires facebook pop library.
At the moment there are only 2 types of animation so feel free to add your custom one :)

## Example usage

``` objective-c
        //wa switch
        let nativeSwitch = WACustomSwitch(frame: CGRect(x:100, y:44, width:60, height:35), animationType: AnimationType.NativeAnimation)
        view.addSubview(nativeSwitch)
        
        let customSwitch = WACustomSwitch(frame: CGRect(x:100, y:144, width:100, height:50), animationType: AnimationType.DayNightAnimation)
        view.addSubview(customSwitch)
        //oberver customSwitch valued changed
        customSwitch.addTarget(self, action: Selector("toggleValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
    }

    func toggleValueChanged(toggle: WACustomSwitch){
        NSLog("value updated %@", toggle.on)    
    }
        
```

## Contact

Wendy Abrantes

- https://github.com/wendyabrantes
- https://twitter.com/wendyabrantes
- abranteswendy@gmail.com

## License

The MIT License (MIT)

Copyright (c) 2015 Wendy Abrantes

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
