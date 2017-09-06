//
//  customButton.swift
//  first swift -- app
//
//  Created by zfd on 16/7/26.
//  Copyright © 2016年 zfd. All rights reserved.
//

import UIKit

class customButton: UIButton {

    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        
        return CGRect(x: self.bounds.size.height*0.5, y: self.bounds.size.height*0.4,width: self.bounds.size.width ,height: self.bounds.size.width*0.4)
        
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height*0.8)
    }
    
}
