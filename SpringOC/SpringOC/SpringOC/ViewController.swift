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
    dynamic var title:NSString?
}

class ViewController: UIViewController {
    
    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var testLb: UILabel!
    @IBOutlet weak var ttextField: UITextField!
    
    let mybean = MyBean()
    
    deinit {
        self.mybean.sp_release()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.testView.sp_bindMapper { (mapper) in
            mapper.backgroundColor = "bgColor"
        }
        
        self.testLb.sp_bindMapper { (mapper) in
            mapper.text = "title"
            mapper.fontColor = "bgColor"
        }
        
        self.mybean.sp_start(with: [self.testView,self.testLb])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tstClick(_ sender: Any) {
        
        self.mybean.bgColor = UIColor.yellow
        self.mybean.title = "clicked"
    }

}

