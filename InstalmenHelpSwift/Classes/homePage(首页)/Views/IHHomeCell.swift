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
    var scacle = 1.0
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = defaultPurple_Color
        createUI()
    }
    
    func createUI() {
        
        /*头像*/
        self.headPortrait = UIImageView()
        self.headPortrait?.image = UIImage.init(named: "LR_enterpriseUser")
        self.contentView.addSubview(self.headPortrait!)
        self.headPortrait?.isUserInteractionEnabled = true
        self.headPortrait?.snp.makeConstraints({ (make) in
           
            make.top.equalTo(27)
            make.width.height.equalTo(51 * scacle).priority(250)
            make.left.equalTo(15)
            
            make.width.height.width.lessThanOrEqualTo(200)
        })
        
        let tapSihgle = UITapGestureRecognizer(target:self,action:#selector(tapSingleDid))
        tapSihgle.numberOfTapsRequired = 1
        tapSihgle.numberOfTouchesRequired = 1
        self.headPortrait?.addGestureRecognizer(tapSihgle)
        
        /*姓名*/
        self.nameLabel = UILabel()
        self.nameLabel?.text = "时光小屋"
        self.nameLabel?.textColor = white_Color
        self.contentView.addSubview(self.nameLabel!)
        self.nameLabel?.snp.makeConstraints({ (make) in
            
            make.centerY.equalTo(self.headPortrait!)
            make.left.equalTo(self.headPortrait!.snp.right).offset(10)
            make.width.equalTo(150)
        })
        
        /*消息*/
        self.newsIcon = UIImageView()
        self.newsIcon?.image = UIImage.init(named: "home_news")
        self.contentView.addSubview(self.newsIcon!)
        self.newsIcon?.snp.makeConstraints({ (make) in
            
            make.right.equalTo(-15)
            make.centerY.equalTo(self.headPortrait!)
            make.width.height.equalTo(35)
        })
    }
    
    
    func tapSingleDid() {
        
        scacle += 0
        UIView.animate(withDuration: 0.3) {
            
            self.headPortrait?.snp.updateConstraints({ (make) in
                
                make.width.height.equalTo(51 * self.scacle).priority(250)
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
