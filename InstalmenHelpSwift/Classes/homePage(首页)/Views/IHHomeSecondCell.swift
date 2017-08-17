//
//  IHHomeSecondCell.swift
//  InstalmenHelpSwift
//
//  Created by XQT-zfd on 2017/8/16.
//  Copyright © 2017年 XQT-zfd. All rights reserved.
//

import UIKit

class IHHomeSecondCell: UITableViewCell {

    var bgView:UIView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createUI()
    }
    
    func createUI() {
        
        bgView = UIView.init(frame: CGRect(x: 15, y: 15, width: SCREEN_WIDTH - 30, height: 200))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
