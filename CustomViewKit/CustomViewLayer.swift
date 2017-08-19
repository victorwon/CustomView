//
//  CustomView2.swift
//  CustomViewTest
//
//  Created by Yume on 2015/3/20.
//  Copyright (c) 2015年 yume. All rights reserved.
//

import UIKit

@IBDesignable
open class CustomViewLayer: CustomViewSource {
    
    @IBInspectable open var borderColor: UIColor? {
        didSet {
            if let color = borderColor {
                layer.borderColor = color.cgColor
            }
        }
    }
    @IBInspectable open var borderWidth: CGFloat = CGFloat.infinity { didSet { layer.borderWidth = borderWidth }}
    
    @IBInspectable open var cornerRadius: CGFloat = CGFloat.infinity { didSet { layer.cornerRadius = cornerRadius }}
    
    @IBInspectable open var shadowColor: UIColor? {
        didSet {
            if let color = shadowColor{
                layer.shadowColor = color.cgColor
            }
        }
    }
    @IBInspectable open var shadowRadius: CGFloat = CGFloat.infinity { didSet { layer.shadowRadius = shadowRadius }}
    @IBInspectable open var shadowOpacity: Float = Float.infinity { didSet { layer.shadowOpacity = shadowOpacity }}
    @IBInspectable open var shadowOffsetY: CGFloat = CGFloat.infinity { didSet { layer.shadowOffset.height = shadowOffsetY }}
    
}
