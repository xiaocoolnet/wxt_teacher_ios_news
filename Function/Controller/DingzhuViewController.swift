//
//  JiazhangViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/19.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class DingzhuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let dataTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "家长叮嘱"
        self.view.backgroundColor = UIColor.whiteColor()
        self.dataTableView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height - 64)
        self.dataTableView.delegate = self
        self.dataTableView.dataSource = self
        self.dataTableView.registerClass(DingZhuTableViewCell.self, forCellReuseIdentifier: "dingzhu")
        self.dataTableView.tableFooterView = UIView(frame: CGRectZero)
        self.automaticallyAdjustsScrollViewInsets = false
        self.tabBarController?.tabBar.hidden = true
        self.view.addSubview(dataTableView)

        // Do any additional setup after loading the view.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("dingzhu", forIndexPath: indexPath) as! DingZhuTableViewCell
        cell.selectionStyle = .None
        cell.nameLabel.frame = CGRectMake(10, 20, 61, 15)
        cell.nameLabel.text = "小明爸爸"
        cell.btn.backgroundColor = UIColor(red: 245/255, green: 80/255, blue: 102/255, alpha: 1)
        cell.btn.layer.borderWidth = 0
        cell.btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        cell.btn.setTitle("查看", forState: .Normal)
        cell.btn.addTarget(self, action: #selector(DingzhuViewController.DingzhuXiangqing), forControlEvents: .TouchUpInside)
        cell.btn.frame.origin.x = self.view.bounds.width - 80
        return cell
    }

    func DingzhuXiangqing(){
        let dingzhuxq = DingzhuXiangqingViewController()
        self.navigationController?.pushViewController(dingzhuxq, animated: true)
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
