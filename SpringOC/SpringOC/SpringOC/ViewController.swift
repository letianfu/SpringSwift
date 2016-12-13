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
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var testView: UIView!
    
    let mybean = MyBean()
    
    deinit {
        self.mybean.sp_release()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.testView.sp_bind(self.mybean, makeMapper: { mapper in
            mapper.backgroundColor = "bgColor"
        })
        
        self.mybean.sp_start()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tstClick(_ sender: Any) {
        
        self.mybean.bgColor = UIColor.yellow
    }

}

