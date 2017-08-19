//
//  CustomView2.swift
//  CustomViewTest
//
//  Created by Yume on 2015/3/20.
//  Copyright (c) 2015年 yume. All rights reserved.
//

import UIKit

@IBDesignable
open class CustomViewLayerStyle: CustomViewLayer {
    
    @IBInspectable open var style:String = "none" {
        didSet{
            if let _style = ViewStyleInstance.value(forKey: style) as? ViewStyle {
                _viewStyle = _style
            }
        }
    }
    
}

// MARK: Style
public extension CustomViewLayerStyle {
    fileprivate func setViewStyle(_ vStyle:ViewStyle){
        
        if let _borderColor = borderColor?.cgColor ?? vStyle.borderColor?.cgColor {
            layer.borderColor = _borderColor
        }
        
        if let _borderWidth = borderWidth != CGFloat.infinity ? borderWidth : vStyle.borderWidth {
            layer.borderWidth = _borderWidth
        }
        
        if let _cornerRadius = cornerRadius != CGFloat.infinity ? cornerRadius : vStyle.cornerRadius {
            layer.cornerRadius = _cornerRadius
        }
        
        if let _shadowRadius = shadowRadius != CGFloat.infinity ? shadowRadius : vStyle.shadowRadius{
            layer.shadowRadius = _shadowRadius
        }
        
        if let _shadowColor = shadowColor?.cgColor ?? vStyle.shadowColor?.cgColor{
            layer.shadowColor = _shadowColor
        }
        
        if let _shadowOpacity = shadowOpacity != Float.infinity ? shadowOpacity: vStyle.shadowOpacity{
            layer.shadowOpacity = _shadowOpacity
        }
        
        if let _shadowOffsetY = shadowOffsetY != CGFloat.infinity ? shadowOffsetY : vStyle.shadowOffsetY{
            layer.shadowOffset.height = _shadowOffsetY
        }
    }
    
    fileprivate var _viewStyle:ViewStyle{
        set{ setViewStyle(newValue) }
        get{ return ViewStyleInstance.none() }
    }
}
