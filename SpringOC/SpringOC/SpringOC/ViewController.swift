//
//  ViewController.swift
//  SpringOC
//
//  Created by fuletian on 2016/12/12.
//  Copyright © 2016年 letian. All rights reserved.
//

import UIKit

class MyBean : NSObject{
    
    dynamic var bgColor:UIColor?
    dynamic var title:NSString?{
        didSet{
            if(self.title == "123"){
                self.isViewHidden = true
            }else{
                self.isViewHidden = false
            }
        }
    }
    dynamic var isViewHidden = false
    
    var typedText:String?{
        didSet{
            if(typedText == "123"){
                self.isViewHidden = true
            }else{
                self.isViewHidden = false
            }
        }
    }
    
    func testBtnClick(){
        print("click")
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var testLb: UILabel!
    @IBOutlet weak var ttextField: UITextField!
    @IBOutlet weak var testBtn: UIButton!
    
    let mybean = MyBean()
    
    deinit {
        self.mybean.sp_release()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.testView.sp_bindMapper { (mapper) in
            mapper.backgroundColor = "bgColor"
            mapper.isHidden = "isViewHidden"
        }
        
        self.testLb.sp_bindMapper { (mapper) in
            mapper.text = "title"
            mapper.fontColor = "bgColor"
        }
        
        self.ttextField.sp_bindMapper { (mapper) in
            mapper.backgroundColor = "bgColor"
            mapper.onTextChangedTo = "title"
        }
        
        self.testBtn.sp_bindMapper { (mapper) in
            mapper.backgroundColor = "bgColor"
            mapper.onClickCall = "testBtnClick"
        }
        
        self.mybean.sp_start(with: [self.testView,self.testLb,self.ttextField,self.testBtn])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tstClick(_ sender: Any) {
        
        self.mybean.bgColor = UIColor.yellow
    }

}

