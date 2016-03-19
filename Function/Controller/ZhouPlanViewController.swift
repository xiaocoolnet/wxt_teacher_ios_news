//
//  ZhouPlanViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/13.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class ZhouPlanViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let zhouPlanTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "周计划"
        self.zhouPlanTableView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
        self.zhouPlanTableView.dataSource = self
        self.zhouPlanTableView.delegate = self
        self.zhouPlanTableView.tableFooterView = UIView(frame: CGRectZero)
        self.automaticallyAdjustsScrollViewInsets = false
        self.tabBarController?.tabBar.hidden = true
        self.view.addSubview(self.zhouPlanTableView)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let contentLabel = UILabel()
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.textLabel?.text = "星期\(indexPath.row + 1)"
        contentLabel.frame = CGRectMake(102, 16, self.view.bounds.width - 102, 14)
        contentLabel.font = UIFont.systemFontOfSize(14)
        contentLabel.text = "学习第一单元英语单词"
        contentLabel.textColor = UIColor.grayColor()
        cell.contentView.addSubview(contentLabel)
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
