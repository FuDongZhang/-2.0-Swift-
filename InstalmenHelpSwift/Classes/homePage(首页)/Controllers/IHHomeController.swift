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
    }
}

extension IHHomeController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId : String = "cellId"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellId)
        }
        cell?.textLabel?.text = "123456789";
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView!.deselectRow(at: indexPath, animated: true)
    }
}
