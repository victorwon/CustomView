//
//  CustomView2.swift
//  CustomViewTest
//
//  Created by Yume on 2015/3/20.
//  Copyright (c) 2015年 yume. All rights reserved.
//

import UIKit

@IBDesignable
open class CustomViewLight: UIView {
    
    open var view:UIView?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init(coder : NSCoder) {
        super.init(coder:coder)!
        setup()
    }
    
    open func setup(){
        instantiateWithXib()
    }
    
    deinit{
        view = nil
    }
    
}

protocol CustomViewBundle {
    func frameworkBundle() -> Bundle?
    func className() -> String
}

// MARK: Bundle
extension CustomViewLight: CustomViewBundle {
    
    public func frameworkBundle() -> Bundle?{
        return Bundle(for: self.classForCoder)
    }
    
    public func className() -> String{
        return String.className(self.classForCoder)
    }
    
    fileprivate func instantiateWithXib(){
        let bundle:Bundle? = frameworkBundle()
        let nibUrl = bundle?.url(forResource: className(), withExtension: "nib")
        if bundle == nil || nibUrl == nil {
            insertBlankView()
            return
        }
        
        let nib:UINib = UINib(nibName: className(), bundle: bundle)
        var views = nib.instantiate(withOwner: self, options: nil)
        
        if views.count >= 1 {
            if let view = views[0] as? UIView {
                matchTwoViewsUsingAutolayout(view)
            }
        }
    }
    
    fileprivate func insertBlankView(){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        matchTwoViewsUsingAutolayout(view)
    }
    
    fileprivate func matchTwoViewsUsingAutolayout(_ view:UIView) {
        self.view = view
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        
        self <- view.top == self.top
        self <- view.bottom == self.bottom
        self <- view.trailing == self.trailing
        self <- view.leading == self.leading
    }
    
}
