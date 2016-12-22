//
//  DockMenuCell.swift
//  SpringOC
//
//  Created by fuletian on 2016/12/19.
//  Copyright © 2016年 letian. All rights reserved.
//

import UIKit
import pop

class DockMenuCell: UICollectionViewCell {

    @IBOutlet weak var imvView: UIImageView!
    
    @IBOutlet weak var titleLb: UILabel!
    
    private var indexPath:IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        self.backgroundColor = UIColor.clear
        
//        self.imvView.contentMode = UIViewContentMode.scaleToFill
        
        NotificationCenter.default.addObserver(self, selector: #selector(DockMenuCell.onReceivedLongPressGes(note:)), name: DockMenuManager.NOTI_WHEN_LONG_PRESS_CELL, object: nil)
    }

    func setBean(bean:DockMenuBean,indexPath:IndexPath){
        
        self.indexPath = indexPath
        
        self.imvView.image = UIImage(named: bean.img)
        self.titleLb.text = bean.title
    }
    
    func onReceivedLongPressGes(note:Notification){
        
        if let indexPath = note.userInfo?["indexPath"] as? IndexPath{
            
            if indexPath.row == self.indexPath.row && indexPath.section == self.indexPath.section {
                
                let state = note.userInfo!["state"] as! String
                
                if state == "begin"{
                    let anim = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
                    anim?.duration = 0.3
                    anim?.toValue = NSValue(cgSize: CGSize(width: 1.3, height: 1.3))
                    
                    self.imvView.layer.pop_add(anim, forKey: "scale")
                    
                    self.titleLb.isHidden = true
                }
                else{
                    
                    let anim = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
                    anim?.duration = 0.3
                    anim?.toValue = NSValue(cgSize: CGSize(width: 1, height: 1))
                    
                    self.imvView.layer.pop_add(anim, forKey: "scale")
                    
                    self.titleLb.isHidden = false
                }
                
            }
        }
    }
}
