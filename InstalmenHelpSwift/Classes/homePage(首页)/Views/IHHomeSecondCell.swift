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
        
        bgView = UIView()
        self.contentView.addSubview(bgView!)
        bgView?.backgroundColor = UIColor.red
        bgView?.layer.masksToBounds = true
        bgView?.layer.cornerRadius = 5.0
        bgView?.snp.makeConstraints({ (make) in
          
            make.edges.equalTo(self.contentView).inset(UIEdgeInsetsMake(0, 15, 0, 15))
        })
        
        var button:UIButton!
        let space = bgView!.frame.size.width / 3 - 10
        
        
        for i in 1...6{
            
            let row = i % 2  /*行*/
            let line = i / 2 /*列*/
            
            button = UIButton()
            bgView?.addSubview(button)
            button.backgroundColor = defaultPurple_Color
            button.snp.makeConstraints({ (make) in
                
                make.left.equalTo(5.0 + CGFloat((line - 1)) * space)
                make.top.equalTo(5 + 85 * row)
                make.width.height.equalTo(80)
            })
        }
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
