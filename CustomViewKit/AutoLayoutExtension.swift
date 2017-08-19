//
//  AutoLayoutExtension.swift
//  CustomViewTest
//
//  Created by Yume on 2015/3/14.
//  Copyright (c) 2015年 yume. All rights reserved.
//

import UIKit

public struct LayoutAttribute {
    public var view:UIView?
    public var attribute:NSLayoutAttribute
    public var multiplier:CGFloat
    public var constant:CGFloat
    
    init(view:UIView, attribute: NSLayoutAttribute, constant:CGFloat = 0, multiplier:CGFloat = 1.0){
        self.view = view;
        self.attribute = attribute
        self.multiplier = multiplier
        self.constant = constant;
    }
    
}

public extension UIView {
    
    func addConstraints (_ constraints: NSLayoutConstraint...){
        for constraint in constraints {
            self.addConstraint(constraint)
        }
    }
    
    public var width : LayoutAttribute {
        get { return LayoutAttribute(view: self, attribute : .width); }
    }
    
    public var height : LayoutAttribute {
        get { return LayoutAttribute(view: self, attribute : .height); }
    }
    
    public var leading : LayoutAttribute {
        get { return LayoutAttribute(view: self, attribute : .leading); }
    }
    
    public var trailing : LayoutAttribute {
        get { return LayoutAttribute(view: self, attribute : .trailing); }
    }
    
    public var top : LayoutAttribute {
        get { return LayoutAttribute(view: self, attribute : .top); }
    }
    
    public var bottom : LayoutAttribute {
        get { return LayoutAttribute(view: self, attribute : .bottom); }
    }
    
    public var centerX : LayoutAttribute {
        get { return LayoutAttribute(view: self, attribute : .centerX); }
    }
    
    public var centerY : LayoutAttribute {
        get { return LayoutAttribute(view: self, attribute : .centerY); }
    }
    
}

public func == (left: LayoutAttribute, right: LayoutAttribute) -> NSLayoutConstraint {
    let layoutConstraint = NSLayoutConstraint(item:left.view!,
        attribute: left.attribute, relatedBy: NSLayoutRelation.equal, toItem: right.view,
        attribute: right.attribute, multiplier: right.multiplier, constant: right.constant)
    
    return layoutConstraint
}

public func >= (left: LayoutAttribute, right: LayoutAttribute) -> NSLayoutConstraint {
    let layoutConstraint = NSLayoutConstraint(item: left.view!,
        attribute: left.attribute, relatedBy: NSLayoutRelation.greaterThanOrEqual, toItem: right.view, attribute: right.attribute,
        multiplier: right.multiplier, constant: right.constant);
    return layoutConstraint
}

public func <= (left: LayoutAttribute, right: LayoutAttribute) -> NSLayoutConstraint {
    let layoutConstraint = NSLayoutConstraint(item: left.view!,
        attribute: left.attribute, relatedBy: NSLayoutRelation.lessThanOrEqual, toItem: right.view, attribute: right.attribute,
        multiplier: right.multiplier, constant: right.constant);
    return layoutConstraint
}

public func == (left: LayoutAttribute, right: CGFloat) -> NSLayoutConstraint {
    let layoutConstraint = NSLayoutConstraint(item:left.view!,
        attribute: left.attribute, relatedBy: NSLayoutRelation.equal, toItem: nil,
        attribute: .notAnAttribute, multiplier: 1.0, constant: right)
    
    return layoutConstraint
}

public func <= (left: LayoutAttribute, right: CGFloat) -> NSLayoutConstraint {
    let layoutConstraint = NSLayoutConstraint(item:left.view!,
        attribute: left.attribute, relatedBy: NSLayoutRelation.lessThanOrEqual, toItem: nil,
        attribute: .notAnAttribute, multiplier: 1.0, constant: right)
    
    return layoutConstraint
}

public func >= (left: LayoutAttribute, right: CGFloat) -> NSLayoutConstraint {
    let layoutConstraint = NSLayoutConstraint(item:left.view!,
        attribute: left.attribute, relatedBy: NSLayoutRelation.greaterThanOrEqual, toItem: nil,
        attribute: .notAnAttribute, multiplier: 1.0, constant: right)
    
    return layoutConstraint
}

// ------------------------------------------

//infix operator *+ {
//    associativity left
//    precedence 150
//}

precedencegroup LayoutAttrPrecedence {
    associativity: left
    higherThan: LogicalConjunctionPrecedence
}
infix operator *+ : LayoutAttrPrecedence

public func *+(left: LayoutAttribute, right: (multiplier:CGFloat, contant:CGFloat)) -> LayoutAttribute {
    let layoutAttribute = LayoutAttribute(view:left.view!, attribute: left.attribute, constant: right.contant, multiplier:right.multiplier)
    return layoutAttribute
}

public func *(left: LayoutAttribute, right: CGFloat) -> LayoutAttribute {
    let layoutAttribute = LayoutAttribute(view:left.view!, attribute: left.attribute, constant: 0, multiplier:right)
    return layoutAttribute
}

public func +(left: LayoutAttribute, right: CGFloat) -> LayoutAttribute {
    let layoutAttribute = LayoutAttribute(view:left.view!, attribute: left.attribute, constant: right, multiplier:left.multiplier)
    return layoutAttribute
}

public func -(left: LayoutAttribute, right: CGFloat) -> LayoutAttribute {
    let layoutAttribute = LayoutAttribute(view:left.view!, attribute: left.attribute, constant: -right, multiplier:left.multiplier)
    return layoutAttribute
}

//infix operator <~ {
//    associativity left
//    precedence 125
//}
precedencegroup LayoutConsPrecedence {
    associativity: left
    higherThan: LogicalConjunctionPrecedence
}
infix operator <~ : LayoutConsPrecedence


public func <~ (left: NSLayoutConstraint, right: UILayoutPriority) -> NSLayoutConstraint {
    left.priority = right
    return left
}

//infix operator <- {
//    associativity right
//    precedence 90
//}
precedencegroup UIViewPrecedence {
    associativity: right
    lowerThan: LogicalConjunctionPrecedence
}
infix operator <- : UIViewPrecedence

public func <- (left: UIView, right: NSLayoutConstraint) -> UIView {
    left.addConstraint(right)
    return left
}
