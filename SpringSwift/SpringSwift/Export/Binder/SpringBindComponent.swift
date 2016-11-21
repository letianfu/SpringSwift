//
//  SpringBindComponent.swift
//  SwiftSpring
//
//  Created by fuletian on 2016/9/29.
//  Copyright © 2016年 letian. All rights reserved.
//

import UIKit

class SpringMutableProperties:NSObject{
    
    var computedProp:String!
    
    var storeProps = [String]()
}

extension String{
    
    func sp_mutableProperties()->SpringMutableProperties?{
        
        if self.contains("{") == false && self.contains("}") == false {
            return nil
        }
        
        if let dic = self.sp_dictionaryFrom(_mutableProperties: self){
            let property = dic.first!.0
            if let container = dic[property]{
                
                let m = SpringMutableProperties()
                m.computedProp = property
                
                if let computed = container["computed"]{
                    let ary = computed.components(separatedBy: ",")
                    for keypath in ary{
                        m.storeProps.append(keypath)
                    }
                }
                
                return m
            }
        }
        
        return nil
    }
    
    func sp_dictionaryFrom(_mutableProperties mutablPropertiesText:String)->[String:[String:String]]?{
        var text = mutablPropertiesText.replacingOccurrences(of: ":", with: "\":")
        text = text.replacingOccurrences(of: "{", with: "{\"")
        text = text.replacingOccurrences(of: "'", with: "\"")
        text = "{\""+text+"}"
        
        if let data = text.data(using: String.Encoding.utf8){
            let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
            if let ressult = json{
                return ressult as? [String : [String : String]]
            }
        }
        
        return nil
    }
}

protocol SpringBindViewInfoDelegate {
    
    /*
        添加对model字段的观察
        keypath - 用户设定的值，可能是store值,可能是 computed的表达式值
        return - 去除表达式的值
     */
    func addObserverForKeyPath(_keyPath keyPath:String)->String
    
    //响应事件，改变model的属性值
    func updateModel(_keyPath keyPath:String,value:AnyObject?)
    
    //触发Model的某个方法
    func eventMethod(_selector selector:Selector)
    
}

class SpringBindViewData:NSObject{
    var backgroundColor:String?
    var borderColor:String?
    var borderWidth:String?
    var isHidden:String?
    var isEnable:String?
}

class SpringBindViewInfo: NSObject{
    
    var backgroundColor:String?
    var borderColor:String?
    var borderWidth:String?
    var isHidden:String?
    var isEnable:String?
    
    var delegate:SpringBindViewInfoDelegate?
    
    weak var view:UIView?
    
    init(delegate:SpringBindViewInfoDelegate) {
        super.init()
        self.delegate = delegate
    }
    
    func setup(_view view:UIView,data:SpringBindViewData) {
        
        self.view = view
        
        if let key = data.backgroundColor{
            self.backgroundColor = self.delegate?.addObserverForKeyPath(_keyPath: key)
        }
        
        if let key = data.borderColor{
            self.borderColor = self.delegate?.addObserverForKeyPath(_keyPath: key)
        }
        
        if let key = data.borderWidth{
            self.borderWidth = self.delegate?.addObserverForKeyPath(_keyPath: key)
        }
        
        if let key = data.isHidden {
            self.isHidden = self.delegate?.addObserverForKeyPath(_keyPath: key)
        }
        
        if let key = data.isEnable {
            self.isEnable = self.delegate?.addObserverForKeyPath(_keyPath: key)
        }
        
    }
    
    func valueChangedFor(_keyPath keyPath:String,value:NSObject?){
        if keyPath == self.backgroundColor {
            self.view?.backgroundColor = value as? UIColor
        }
        else if keyPath == self.borderColor {
            self.view?.layer.borderColor = (value as? UIColor)?.cgColor
        }
        else if keyPath == self.borderWidth {
            if let v = value{
                self.view?.layer.borderWidth = v as! CGFloat
            }else{
                self.view?.layer.borderWidth = 0
            }
        }
        else if keyPath == self.isHidden {
            if let v = value{
                self.view?.isHidden = v as! Bool
            }else{
                self.view?.isHidden = false
            }
        }
        else if keyPath == self.isEnable {
            let control = self.view as? UIControl
            if let v = value {
                control?.isEnabled = v as! Bool
            }
            else{
                control?.isEnabled = false
            }
        }
    }
}

class SpringBindTextFieldData: SpringBindViewData {
    var text:String?
    var editingChanged:String?
}

///UITextField
class SpringBindTextFieldInfo: SpringBindViewInfo{
    
    //观察值
    var text:String?
    
    //事件响应改变值
    var editingChanged:String?
    
    weak var textField:UITextField?
    
    override init(delegate:SpringBindViewInfoDelegate) {
        super.init(delegate: delegate)
    }
    
    func setup(_textField textField:UITextField,data:SpringBindTextFieldData) {
        super.setup(_view: textField, data: data)
        
        self.textField = textField
        
        if let key = data.text {
            self.text = self.delegate?.addObserverForKeyPath(_keyPath: key )
        }
        
        if let key = data.editingChanged {
            self.editingChanged = key
        }
        
        if let key = data.editingChanged {
            self.editingChanged = key
            self.textField?.addTarget(self, action: #selector(SpringBindTextFieldInfo.didTextFieldEditingChanged), for: UIControlEvents.editingChanged)
        }
        
    }
    
    override func valueChangedFor(_keyPath keyPath:String,value:NSObject?){
        super.valueChangedFor(_keyPath: keyPath, value: value)
        
        if keyPath == self.text {
            self.textField?.text = value as? String
        }
    }
    
    //文字改变时
    func didTextFieldEditingChanged(){
        let text = self.textField?.text
        self.delegate?.updateModel(_keyPath: self.editingChanged!, value: text as AnyObject?)
    }
    
}

class SpringBindLabelData: SpringBindViewData {
    var text:String?
}

///UILabel的绑定信息
class SpringBindLabelInfo: SpringBindViewInfo{
    
    var text:String?
    
    weak var label:UILabel?
    
    override init(delegate:SpringBindViewInfoDelegate) {
        super.init(delegate: delegate)
    }
    
    func setup(_label label:UILabel,data:SpringBindLabelData) {
        super.setup(_view: label, data: data)
        
        self.label = label
        
        if let key = data.text {
            self.text = self.delegate?.addObserverForKeyPath(_keyPath: key )
        }
        
    }
    
    override func valueChangedFor(_keyPath keyPath:String,value:NSObject?){
        super.valueChangedFor(_keyPath: keyPath, value: value)
        
        if keyPath == self.text {
            self.label?.text = value as? String
        }
    }
    
}

class SpringBindButtonData:SpringBindViewData{
    var click:String?
    
    var normalImageName:String?
}

/// button
class SpringBindButtonInfo:SpringBindViewInfo{
    
    var click:String?
    
    var normalImageName:String?
    
    weak var button:UIButton?
    
    override init(delegate:SpringBindViewInfoDelegate) {
        super.init(delegate: delegate)
    }
    
    func setup(_button button:UIButton,data:SpringBindButtonData) {
        super.setup(_view: button, data: data)
        
        self.button = button
        
        if let key = data.click {
            self.click = key
            self.button?.addTarget(self, action: #selector(SpringBindButtonInfo.buttonClicked), for: UIControlEvents.touchUpInside)
        }
        
        if let key = data.normalImageName {
            self.normalImageName = self.delegate?.addObserverForKeyPath(_keyPath: key)
        }
        
    }
    
    func buttonClicked(){
        self.delegate?.eventMethod(_selector: NSSelectorFromString(self.click!))
    }
    
    override func valueChangedFor(_keyPath keyPath:String,value:NSObject?){
        super.valueChangedFor(_keyPath: keyPath, value: value)
        
        if self.normalImageName == keyPath{
            if let source = value {
                self.button?.setImage(UIImage(named: source as! String), for: UIControlState())
            }
            else{
                self.button?.setImage(nil, for: UIControlState())
            }
        }
    }
}

class SpringBindImageViewData:SpringBindViewData{
    var imageName:String?
    var image:String?
}

///imageview
class SpringBindImageViewInfo:SpringBindViewInfo{
    var imageName:String?
    var image:String?
    
    weak var imageView:UIImageView?
    
    func setup(_imageView imageView:UIImageView,data:SpringBindImageViewData) {
        super.setup(_view: imageView, data: data)
        
        self.imageView = imageView
        
        if let key = data.imageName {
            self.imageName = self.delegate?.addObserverForKeyPath(_keyPath: key )
        }
        
        if let key = data.image{
            self.image = self.delegate?.addObserverForKeyPath(_keyPath: key)
        }
    }
    
    override func valueChangedFor(_keyPath keyPath: String, value: NSObject?) {
        super.valueChangedFor(_keyPath: keyPath, value: value)
        
        if self.imageName == keyPath{
            if let source = value {
                self.imageView?.image = UIImage(named: source as! String)
            }
            else{
                self.imageView?.image = nil
            }
        }
        
        if self.image == keyPath {
            if let source = value {
                self.imageView?.image = source as? UIImage
            }else{
                self.imageView?.image = nil
            }
        }
    }
}
