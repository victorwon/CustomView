CustomView
==========

IOS Custom View with xib(IOS 7 &amp; 8) and Live Render (IOS 8)

 * [Custom View With xib (IOS 7 &amp; 8)](CustomView.md)
 * [Live Render (IOS 8)](LiveRender.md)
 * [Key Value Coding](KVC.md)
 * [Custom View with Xib + Live Render + KVC](CustomView_LiveRender_KVC.md)
 * WWDC 2014 Session 401
    * [Debug Selected Views](WWDC_2014_Session_401.md/#debugSelectedViews)
    * [Debug View Hierarchy](WWDC_2014_Session_401.md/#debugViewHierarchy)

---

# CustomViewKit

### Install

Add a Podfile at your project

    touch Podfile

Add CustomViewKit pod

```
platform :ios, '8.0'
use_frameworks!
pod 'CustomView', '~> 1.1'
```

then create a swift file `CustomViewKitExtension.swift`, and override `bundleIdentifier` method

```
import UIKit
import CustomView

extension CustomViewLight{
    public func bundleIdentifier() -> String{
        //Bundle Identifier can be find at Target -> Your Framework -> Bundle Identifier
        return "com.yume190.PodTest"
    }
}
```

### Usage

##### Only code

Override `setup` method and add your custom code

```
import UIKit
import CustomView

class CV1: CustomViewLight {

    override func setup() {
        super.setup()
        // custom code
        var c = UILabel(frame: CGRectMake(0, 0, 100, 100))
        c.text="1000"
        self.view?.addSubview(c)
    }

}
```

##### With xib

Create swift file and xib file with same name

 * CV2.swift
 * CV2.xib

```
import UIKit
import CustomView

class CV2: CustomViewLayerStyle {

}
```

Set `File's Owner` for your xib

![File's Owner](/images/i5.png)

### Custom Style

##### Add your custom style

```
extension ViewStyles {

    public func customStyle1() -> ViewStyle{
        return ViewStyle().set(borderWidth:20).set(borderColor:UIColor.darkGrayColor()).set(cornorRadius:20)
    }

    public func customStyle2() -> ViewStyle{
        return ViewStyle().set(borderWidth:30).set(borderColor:UIColor.greenColor()).set(cornorRadius:30)
    }
}
```

##### Use your custom style

Set style by string`(method name)`, and `CustomViewLayerStyle` will find the method with KVC(Key Value Coding).

```
var cv2 = CV2(frame:CGRectMake(0, 100, 150, 150))
cv2.style = "customStyle1"
```