//
//  BasicNavigationController.swift
//  InstalmenHelpSwift
//
//  Created by XQT-zfd on 2017/8/15.
//  Copyright © 2017年 XQT-zfd. All rights reserved.
//  'NavigationController的基类'

import UIKit

class BasicNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationChange()
    }
    
    func navigationChange() {
        
        /* 修改导航栏的背景颜色 */
        self.navigationBar.barTintColor = defaultPurple_Color
        /* 修改导航栏的字体颜色 */
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        /* 修改导航栏的按钮颜色 */
        self.navigationBar.tintColor = UIColor.white
    }
    
    func deleteNavigationLine() {
        
        /* 修改导航栏的背景图片 */
        self.navigationBar.setBackgroundImage(UIImage(named: ""), for: UIBarMetrics.default)
        /* 去除导航栏的黑线 */
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        super.pushViewController(viewController, animated: animated)
        
        if (viewController.navigationController?.responds(to: #selector(getter: interactivePopGestureRecognizer)))! {
            
            viewController.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
            viewController.navigationController?.interactivePopGestureRecognizer?.delegate = nil;
        }
        
        if viewController.navigationItem.leftBarButtonItem == nil && self.viewControllers.count > 1{
            
            viewController.navigationItem.leftBarButtonItem = creatBackBtn()
            viewController.navigationItem.leftBarButtonItem?.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        }
    }

    func creatBackBtn() -> UIBarButtonItem {
        
        return UIBarButtonItem.init(image: UIImage(named:"goback_right"), style: .plain, target: self, action: #selector(popself))
    }
    
    func popself() {
        self.popViewController(animated: true)
    }
    
    
}
