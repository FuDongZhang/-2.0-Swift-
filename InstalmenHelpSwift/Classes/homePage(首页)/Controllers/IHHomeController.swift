//
//  IHHomeController.swift
//  InstalmenHelpSwift
//
//  Created by XQT-zfd on 2017/8/15.
//  Copyright © 2017年 XQT-zfd. All rights reserved.
//  '首页'

import UIKit

class IHHomeController: BasicController ,UITableViewDelegate, UITableViewDataSource{

    var dataSource : [String]?
    var tableView : UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

         createTableView()
    }
    
    func createTableView() {
     
        tableView = UITableView.init(frame: CGRect(x:0, y:0, width: SCREEN_WIDTH, height:SCREEN_HEIGHT), style: UITableViewStyle.plain)
        tableView!.dataSource = self
        tableView!.delegate = self
        self.view.addSubview(tableView!)
        tableView?.register(IHHomeCell.classForCoder(), forCellReuseIdentifier: "IHHomeCellId")
        tableView?.register(IHHomeSecondCell.classForCoder(), forCellReuseIdentifier: "IHHomeSecondCell")
    }
}

extension IHHomeController{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 100 : indexPath.row == 1 ? 210 : 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell:IHHomeCell = tableView.dequeueReusableCell(withIdentifier: "IHHomeCellId", for: indexPath) as! IHHomeCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }else if indexPath.section == 1 {
         
            let cell:IHHomeSecondCell = tableView.dequeueReusableCell(withIdentifier: "IHHomeSecondCell", for: indexPath) as! IHHomeSecondCell 
            return cell
        }else{
            
            let cellId = "cellId"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            if cell == nil {
                
                cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellId)
            }
            cell?.textLabel?.text = "123456789";
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView!.deselectRow(at: indexPath, animated: true)
    }
}
