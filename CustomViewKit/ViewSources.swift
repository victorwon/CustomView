//
//  ViewSources.swift
//  CustomViewTest
//
//  Created by Yume on 2015/4/8.
//  Copyright (c) 2015年 yume. All rights reserved.
//

import UIKit

public protocol ViewSource:class {
    func action(_ cv:CustomViewLight)
}

open class ViewSources: NSObject {
    
    private static var __once: () = {
            Inner.instance = ViewSources()
        }()
    
    open class var sharedInstance: ViewSources {
        _ = ViewSources.__once
        return Inner.instance!
    }
    
    struct Inner {
        static var instance: ViewSources?
        static var token: Int = 0
    }
    
    override open func value(forUndefinedKey key: String) -> Any? {
        return nil
    }
    
}

public var ViewSourcesInstance: ViewSources { get { return ViewSources.sharedInstance } }

open class DummyViewSource:ViewSource {
    @objc open func action(_ cv:CustomViewLight) {
    }
}

open class YumeViewSource<T>:DummyViewSource{
    public typealias SettingClosure = ((T) -> ())
    
    fileprivate var _settings: SettingClosure
    public init(settings:@escaping SettingClosure){
        _settings = settings
    }
    
    open override func action(_ cv:CustomViewLight){
        if let _view = cv as? T {
            _settings(_view)
            
        }
    }
    
}
