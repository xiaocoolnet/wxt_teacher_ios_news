//
//  TongGaoViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/29.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class TongGaoListViewController:UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let TongGaoList = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        TongGaoList.delegate = self
        TongGaoList.dataSource = self
        self.title = "公告列表"
        TongGaoList.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height - 64)
        TongGaoList.tableFooterView = UIView(frame: CGRectZero)
        self.view.addSubview(TongGaoList)
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.accessoryType = .DisclosureIndicator
        cell.selectionStyle = .None
        cell.imageView?.image = UIImage(named: "teacherPic")
        cell.textLabel?.text = "新闻标题"
        cell.textLabel?.frame.origin.y = 5
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let teacherinfo = TongGaoInfoViewController()
        self.navigationController?.pushViewController(teacherinfo, animated: true)
    }
    
}
