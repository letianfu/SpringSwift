//
//  DockMenuManager.swift
//  SpringOC
//
//  Created by fuletian on 2016/12/19.
//  Copyright © 2016年 letian. All rights reserved.
//

import UIKit

class DockMenuManager: NSObject,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate{
    
    static let NOTI_WHEN_LONG_PRESS_CELL = NSNotification.Name(rawValue: "NOTI_WHEN_LONG_PRESS_CELL")
    
    private let MENU_IDENTIFY = "MENU_IDENTIFY"
    
    private var view:UICollectionView!
    
    private var menus = [DockMenuBean]()
    
    private var pressGes:UILongPressGestureRecognizer!

    class func create(view:UICollectionView)->DockMenuManager{
        
        let ins = DockMenuManager()
        ins.initWith(view: view)
        
        var index = 4
        while index <= 8 {
            
            let bean = DockMenuBean()
            bean.img = "ic_".appending(String(index)).appending(".png")
            
            if index == 4 {
                bean.title = "设置"
            }
            else if index == 5 {
                bean.title = "相册"
            }
            else if index == 6 {
                bean.title = "时钟"
            }
            else if index == 7 {
                bean.title = "日历"
            }
            else if index == 8 {
                bean.title = "通讯录"
            }
            
            ins.menus.append(bean)
            
            index+=1
        }
        
        return ins
    }
    
    func initWith(view:UICollectionView){
        self.view = view
        view.backgroundColor = UIColor.clear
        
        let nib = UINib(nibName: "DockMenuCell", bundle: nil)
        view.register(nib, forCellWithReuseIdentifier: self.MENU_IDENTIFY)
        
        view.delegate = self
        view.dataSource = self
        
        self.pressGes = UILongPressGestureRecognizer(target: self, action: #selector(DockMenuManager.onLongPressAction(ges:)))
        view.addGestureRecognizer(self.pressGes)
    }
    
    func onLongPressAction(ges:UILongPressGestureRecognizer){
        
        if ges.state == UIGestureRecognizerState.began || ges.state == UIGestureRecognizerState.ended {
            let p = ges.location(in: self.view)
            
            var state = "begin"
            if ges.state == UIGestureRecognizerState.ended {
                state = "ended"
            }
            
            if let indexPath = self.view.indexPathForItem(at: p){
                NotificationCenter.default.post(name: DockMenuManager.NOTI_WHEN_LONG_PRESS_CELL, object: nil, userInfo: ["indexPath":indexPath,"state":state])
            }
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menus.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.MENU_IDENTIFY, for: indexPath) as! DockMenuCell
        
        cell.setBean(bean: self.menus[indexPath.row],indexPath: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (SC_WIDTH-20)/4, height: (SC_WIDTH-20)/4+14)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(20, 10, 0, 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
