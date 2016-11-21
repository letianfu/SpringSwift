//
//  SpringValueBind.swift
//  SwiftSpring
//
//  Created by fuletian on 2016/10/8.
//  Copyright © 2016年 letian. All rights reserved.
//

import UIKit

class SpringValueAction:NSObject{
    var action:((Any?)->Void)!
}

class SpringValueBind: NSObject {
    
    fileprivate var keyPathMap = NSMapTable<AnyObject, AnyObject>.strongToStrongObjects()
    
    weak fileprivate var model:AnyObject?
    
    init(model:AnyObject) {
        self.model = model
    }
    
    deinit {
        self.keyPathMap.removeAllObjects()
        self.model?.removeObserver(self)
    }

    func sp_observeValueFor(_ keyPath:String,action:@escaping ((Any?)->Void)){
        
        let actionObj = SpringValueAction()
        actionObj.action = action
        
        self.keyPathMap.setObject(actionObj, forKey: keyPath as AnyObject?)
        
        self.model?.addObserver(self, forKeyPath: keyPath, options: [.initial], context: nil)
        self.model?.addObserver(self, forKeyPath: keyPath, options: [.new], context: nil)
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if let action = self.keyPathMap.object(forKey: keyPath as AnyObject?) as? SpringValueAction{
            
            if let value = self.model!.value(forKeyPath: keyPath!){
                action.action(value)
            }else{
                action.action(nil)
            }
            
        }
    }
}
