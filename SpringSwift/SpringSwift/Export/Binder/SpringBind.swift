//
//  SpringBind.swift
//  SwiftSpring
//
//  Created by fuletian on 2016/9/29.
//  Copyright © 2016年 letian. All rights reserved.
//

import UIKit

class SpringBind: NSObject,SpringBindViewInfoDelegate {

    var observeringKeyPaths = [String]()
    var infos = [SpringBindViewInfo]()
    
    //storeKeyPath:[computedKeyPath]
    var computedKeyPathMapper = [String:[String]]()
    
    var model:NSObject!
    
    init(model:NSObject) {
        super.init()
        self.model = model
    }
    
    deinit {
        print("")
    }
    
    func sp_addObserverFor(_label label:UILabel,dataBind:((SpringBindLabelData)->Void)){
        let info = SpringBindLabelInfo(delegate: self)
        self.infos.append(info)
        
        let data = SpringBindLabelData()
        dataBind(data)
        
        info.setup(_label:label, data: data)
    }
    func sp_addObserverFor(_textField textFiled:UITextField,dataBind:((SpringBindTextFieldData)->Void)){
        let info = SpringBindTextFieldInfo(delegate: self)
        self.infos.append(info)
        
        let data = SpringBindTextFieldData()
        dataBind(data)
        
        info.setup(_textField:textFiled, data: data)
    }
    
    func sp_addObserverFor(_button button:UIButton,dataBind:((SpringBindButtonData)->Void)){
        let info = SpringBindButtonInfo(delegate: self)
        self.infos.append(info)
        
        let data = SpringBindButtonData()
        dataBind(data)
        info.setup(_button:button, data: data)
    }
    
    func sp_addObserverFor(_imageView imageView:UIImageView,dataBind:((SpringBindImageViewData)->Void)){
        let info = SpringBindImageViewInfo(delegate: self)
        self.infos.append(info)
        
        let data = SpringBindImageViewData()
        dataBind(data)
        info.setup(_imageView:imageView, data: data)
    }
    
    /*
     *  启动监听
     * - initial 是否初始化值
     */
    
    func sp_startObserver(_ initial:Bool=false){
        
        for key in self.observeringKeyPaths {
            self.model.addObserver(self, forKeyPath: key, options: NSKeyValueObservingOptions.new, context: nil)
            if initial {
                self.model.addObserver(self, forKeyPath: key, options: NSKeyValueObservingOptions.initial, context: nil)
            }
        }
    }
    
    func sp_remove(){
        for keyPath in observeringKeyPaths{
            self.model.removeObserver(self, forKeyPath: keyPath)
        }
    }
    
    //MARK :-SpringBindViewInfoDelegate
    func addObserverForKeyPath(_keyPath keyPath: String)->String {
        
        var returnKeyPath:String = keyPath
        
        var listenningKeyPaths = [String]()
        
        if let m = keyPath.sp_mutableProperties(){
            self.appendComputedKeyPath(_mutableProperties: m)
            if m.storeProps.count > 0 {
                listenningKeyPaths.append(contentsOf: m.storeProps)
            }
            
            returnKeyPath = m.computedProp
        }else{
            listenningKeyPaths.append(keyPath)
        }
        
        for key in listenningKeyPaths {
            if self.observeringKeyPaths.contains(key) == false {
                self.observeringKeyPaths.append(key)
            }
        }
        
        return returnKeyPath
    }
    
    func updateModel(_keyPath keyPath: String, value: AnyObject?) {
        self.model.setValue(value, forKey: keyPath)
    }
    
    func eventMethod(_selector selector: Selector) {
        self.model.perform(selector)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if let key = keyPath{
            
            var keyPaths = [key]
            if let computedKeyPaths = self.computedKeyPathMapper[key]{
                keyPaths.append(contentsOf: computedKeyPaths)
            }
            
            for item in keyPaths {
                let value = self.model.value(forKey: item)
                for info in infos {
                    info.valueChangedFor(_keyPath:item, value: value as! NSObject?)
                }
            }
        }
    }
    
    func appendComputedKeyPath(_mutableProperties mutableProperties:SpringMutableProperties){
        
        for storeKeyPath in mutableProperties.storeProps{
            
            var ary = self.computedKeyPathMapper[storeKeyPath]
            if ary == nil {
                ary = [String]()
            }
            
            if ary?.contains(mutableProperties.computedProp) == false {
                ary!.append(mutableProperties.computedProp)
            }
            
            self.computedKeyPathMapper[storeKeyPath] = ary
            
        }
    }
}
