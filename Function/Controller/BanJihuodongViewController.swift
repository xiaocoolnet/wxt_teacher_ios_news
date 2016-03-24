//
//  BanJihuodongViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/15.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class BanJihuodongViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let huoDongTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "班级活动"
        self.view.backgroundColor = UIColor.whiteColor()
        self.automaticallyAdjustsScrollViewInsets = false
        huoDongTableView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
        self.huoDongTableView.tableFooterView = UIView(frame: CGRectZero)
        huoDongTableView.delegate = self
        huoDongTableView.dataSource = self
        self.tabBarController?.tabBar.hidden = true
        self.view.addSubview(huoDongTableView)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.selectionStyle = .None
        cell.accessoryType = .DisclosureIndicator
        cell.imageView?.image = UIImage(named: "运动会")
        cell.imageView?.frame = CGRectMake(10, 10, 80, 80)
        cell.textLabel?.text = "亲子运动会"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let huodongxq = HuoDongXqViewController()
        self.navigationController?.pushViewController(huodongxq, animated: true)
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
