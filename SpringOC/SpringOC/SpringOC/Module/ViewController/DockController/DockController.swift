//
//  DockController.swift
//  SpringOC
//
//  Created by fuletian on 2016/12/19.
//  Copyright © 2016年 letian. All rights reserved.
//

import UIKit

class DockController: UIViewController,DockControllerProtocol {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var collectionViewMgr:DockMenuManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clear
        
        self.collectionViewMgr = DockMenuManager.create(view: self.collectionView)
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

}
