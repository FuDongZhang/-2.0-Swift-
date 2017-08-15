//
//  BasicTabBarController.swift
//  InstalmenHelpSwift
//
//  Created by XQT-zfd on 2017/8/15.
//  Copyright © 2017年 XQT-zfd. All rights reserved.
//  'TabBarController的基类'

import UIKit

class BasicTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addAllChildViewController()
    }
}

extension BasicTabBarController{
    
    func addAllChildViewController() {
        
        addChildController(childController: IHHomeController(), title:"首页", image: "normal_loan", selectedImage: "select_loan")
        addChildController(childController: IHQRCodeController(), title:"二维码", image: "normal_industry", selectedImage: "normal_industry")
        addChildController(childController: IHOrderController(), title:"订单", image: "normal_order", selectedImage: "select_order")
    }
    
    func addChildController(childController:UIViewController, title:String, image:NSString, selectedImage:String) {
        
        childController.title = title
        childController.tabBarItem.image = UIImage.init(named: image as String)
        childController.tabBarItem.selectedImage = UIImage.init(named: selectedImage)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        childController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2)
        
        childController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.purple], for: UIControlState.selected)
        let childNavigation = BasicNavigationController.init(rootViewController: childController)
        
        addChildViewController(childNavigation)
        
    }
}
