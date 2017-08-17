//
//  IHHomeCell.swift
//  InstalmenHelpSwift
//
//  Created by XQT-zfd on 2017/8/15.
//  Copyright © 2017年 XQT-zfd. All rights reserved.
//

import UIKit
import SnapKit

class IHHomeCell: UITableViewCell {

    var headPortrait:UIImageView?
    var nameLabel:UILabel?
    var newsIcon:UIImageView?
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = defaultPurple_Color
        createUI()
    }
    
    func createUI() {
        
        self.headPortrait = UIImageView()
        self.headPortrait?.image = UIImage.init(named: "LR_enterpriseUser")
        self.contentView.addSubview(self.headPortrait!)
        self.headPortrait?.snp.makeConstraints({ (make) in
           
            make.top.equalTo(27)
            make.width.height.equalTo(51)
            make.left.equalTo(15)
        })
        
        self.nameLabel = UILabel()
        self.nameLabel?.text = "时光小屋"
        self.nameLabel?.textColor = white_Color
        self.contentView.addSubview(self.nameLabel!)
        self.nameLabel?.snp.makeConstraints({ (make) in
            
            make.centerY.equalTo(self.headPortrait!)
            make.left.equalTo(self.headPortrait!.snp.right).offset(10)
            make.width.equalTo(150)
        })
        
        self.newsIcon = UIImageView()//UIImageView.init(frame: CGRect(x: SCREEN_WIDTH - 50,y: 45, width: 35, height: 35))
        self.newsIcon?.image = UIImage.init(named: "home_news")
        self.contentView.addSubview(self.newsIcon!)
        self.newsIcon?.snp.makeConstraints({ (make) in
            
            make.right.equalTo(15)
        })
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
