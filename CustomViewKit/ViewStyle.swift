//
//  ViewStyle.swift
//  CustomViewTest
//
//  Created by Yume on 2015/3/15.
//  Copyright (c) 2015年 yume. All rights reserved.
//

import UIKit

public var ViewStyleInstance: ViewStyles { get { return ViewStyles.sharedInstance } }

open class ViewStyle{
    open var borderColor:UIColor?
    open var borderWidth:CGFloat?
    open var cornerRadius:CGFloat?
    open var shadowColor:UIColor?
    open var shadowRadius:CGFloat?
    open var shadowOpacity:Float?
    open var shadowOffsetY:CGFloat?
    
    public init(){}
    
    open func set(borderColor:UIColor) -> ViewStyle{
        self.borderColor = borderColor
        return self
    }
    
    open func set(borderWidth:CGFloat) -> ViewStyle{
        self.borderWidth = borderWidth
        return self
    }
    
    open func set(cornorRadius:CGFloat) -> ViewStyle{
        self.cornerRadius = cornorRadius
        return self
    }
    
    open func set(shadowColor:UIColor) -> ViewStyle{
        self.shadowColor = shadowColor
        return self
    }
    
    open func set(shadowRadius:CGFloat) -> ViewStyle{
        self.shadowRadius = shadowRadius
        return self
    }
    
    open func set(shadowOpacity:Float) -> ViewStyle{
        self.shadowOpacity = shadowOpacity
        return self
    }
    
    open func set(shadowOffsetY:CGFloat) -> ViewStyle{
        self.shadowOffsetY = shadowOffsetY
        return self
    }
    
}

open class ViewStyles: NSObject {
    
    private static var __once: () = {
            Inner.instance = ViewStyles()
        }()
    
    open class var sharedInstance: ViewStyles {
        _ = ViewStyles.__once
        return Inner.instance!
    }
    
    struct Inner {
        static var instance: ViewStyles?
        static var token: Int = 0
    }
    
    open func none() -> ViewStyle{
        return ViewStyle().set(borderColor: UIColor.clear)
                          .set(borderWidth:0)
                          .set(cornorRadius:0)
                          .set(shadowColor:UIColor.clear)
                          .set(shadowRadius:0)
                          .set(shadowOpacity:0)
                          .set(shadowOffsetY:0)
    }
    
    open func fb() -> ViewStyle{
        return ViewStyle().set(borderWidth:10).set(borderColor:UIColor.blue).set(cornorRadius:20)
    }
    
    open func yume() -> ViewStyle{
        return ViewStyle().set(borderWidth:3).set(borderColor:UIColor.purple).set(cornorRadius:30)
    }
    
    override open func value(forUndefinedKey key: String) -> Any? {
        return none()
    }
    
}
