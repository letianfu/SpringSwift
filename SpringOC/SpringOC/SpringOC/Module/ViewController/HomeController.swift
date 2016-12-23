//
//  HomeController.swift
//  SpringOC
//
//  Created by fuletian on 2016/12/15.
//  Copyright © 2016年 letian. All rights reserved.
//

import UIKit
import pop

class HomeController: UIViewController {
    
    static private let leftUtilViewWidth:CGFloat = 240          //左边工具view的宽度
    
    @IBOutlet weak var leftSpace: NSLayoutConstraint!           //container view
    @IBOutlet weak var widthSpace: NSLayoutConstraint!          //container view
    
    @IBOutlet weak var avatarBgView: UIView!
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var widthHomeView: NSLayoutConstraint!
    
    @IBOutlet weak var maskView: UIView!                        //遮罩view
    
    private var maskViewTapGes:UITapGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.leftSpace.constant = 0-HomeController.leftUtilViewWidth
        self.widthSpace.constant = SC_WIDTH + HomeController.leftUtilViewWidth
        self.widthHomeView.constant = SC_WIDTH
        
        self.avatarBgView.layer.masksToBounds = true
        self.avatarBgView.layer.cornerRadius = 39
        
        self.maskViewTapGes = UITapGestureRecognizer(target: self, action: #selector(HomeController.onMaskViewClick))
        self.maskView.layer.opacity = 0
        self.maskView.isUserInteractionEnabled = false
        self.maskView.addGestureRecognizer(self.maskViewTapGes)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

    @IBAction func onHomeAvatarClick(_ sender: Any) {
        
        self.maskView.isUserInteractionEnabled = true
        
        let positionAnim = POPBasicAnimation(propertyNamed: kPOPLayoutConstraintConstant)
        positionAnim?.toValue = NSNumber(value:0)
        positionAnim?.duration = 0.3
        self.leftSpace.pop_add(positionAnim, forKey: "show")
        
        let opcityAnim = POPBasicAnimation(propertyNamed: kPOPLayerOpacity)
        opcityAnim?.toValue = NSNumber(value: 0.3)
        opcityAnim?.duration = 0.2
        self.maskView.layer.pop_add(opcityAnim, forKey: "opcity")
        
    }
    
    func onMaskViewClick(){
        
        self.maskView.isUserInteractionEnabled = false
        
        let positionAnim = POPBasicAnimation(propertyNamed: kPOPLayoutConstraintConstant)
        positionAnim?.toValue = NSNumber(value:Float(0-HomeController.leftUtilViewWidth))
        positionAnim?.duration = 0.3
        self.leftSpace.pop_add(positionAnim, forKey: "hide")
        
        let opcityAnim = POPBasicAnimation(propertyNamed: kPOPLayerOpacity)
        opcityAnim?.toValue = NSNumber(value: 0)
        opcityAnim?.duration = 0.2
        self.maskView.layer.pop_add(opcityAnim, forKey: "opcity")
    }
}
