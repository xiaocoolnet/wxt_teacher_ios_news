//
//  YuanDingViewController.swift
//  WXT_Teachers
//
//  Created by 李春波 on 16/2/23.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class YuanDingViewController: UIViewController,FlexibleTableViewDelegate {
    
    var tableView:FlexibleTableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView = FlexibleTableView(frame: CGRectMake(0, -30, self.view.bounds.width, self.view.bounds.height), delegate: self)
        self.tableView.registerClass(ContactsTableViewCell.self, forCellReuseIdentifier: "ContactsCell")
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(tableView)
    }
    //有几组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //    一组几个父类行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    //    默认的哪一行展开
    func tableView(tableView: UITableView, shouldExpandSubRowsOfCellAtIndexPath indexPath: NSIndexPath) -> Bool {
        if(indexPath.section == 0 && indexPath == 0){
            return true
        }
        return false
    }
    //    哪一行里面有多少子类行
    func tableView(tableView: UITableView, numberOfSubRowsAtIndexPath indexPath: NSIndexPath) -> Int {
        switch (indexPath.row){
        case 0:
            return 2
        case 1:
            return 3
        case 2:
            return 6
        default:
            return 12
        }
        return 0
    }
    //    每一父类行的标题是什么
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = FlexibleTableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.expandable = true
        switch (indexPath.row){
        case 0:
            cell.textLabel?.text = "小二班"
        case 1:
            cell.textLabel?.text = "幼儿三班"
        case 2:
            cell.textLabel?.text = "星星班"
        default:
            cell.textLabel?.text = "大班一班"
        }
        return cell
    }
    // 加载子类行的数据
    func tableView(tableView: UITableView, cellForSubRowAtIndexPath indexPath: FlexibleIndexPath) -> UITableViewCell {
        let duanxinBtn = UIButton()
        let ipBtn = UIButton()
        let phoneBtn = UIButton()
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactsCell", forIndexPath: indexPath.ns) as! ContactsTableViewCell
        duanxinBtn.frame = CGRectMake(0, 26, 17, 17)
        duanxinBtn.frame.origin.x = self.view.bounds.width - 72
        ipBtn.frame = CGRectMake(0, 26, 17, 17)
        ipBtn.frame.origin.x = self.view.bounds.width - 50
        phoneBtn.frame = CGRectMake(0, 26, 17, 17)
        phoneBtn.frame.origin.x = self.view.bounds.width - 30
        duanxinBtn.setImage(UIImage(named: "发消息"), forState: .Normal)
        ipBtn.setImage(UIImage(named: "电话"), forState: .Normal)
        phoneBtn.setImage(UIImage(named: "电话2"), forState: .Normal)
        cell.nameLabel.text = "小明爸爸"
        cell.contentView.addSubview(duanxinBtn)
        cell.contentView.addSubview(ipBtn)
        cell.contentView.addSubview(phoneBtn)
        return cell
    }
    
    func collapseSubrows() {
        tableView.collapseCurrentlyExpandedIndexPaths()
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }

}
