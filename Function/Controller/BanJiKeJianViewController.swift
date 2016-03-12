//
//  BanJiKeJianViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/12.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class BanJiKeJianViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let kejianTableview = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "宝宝课件"
        self.tabBarController?.tabBar.hidden = true
        self.kejianTableview.delegate = self
        self.kejianTableview.dataSource = self
        self.automaticallyAdjustsScrollViewInsets = false
        self.kejianTableview.frame = CGRectMake(0, 64, self.view.bounds.width, self.view.bounds.height - 64)
        self.kejianTableview.tableFooterView = UIView(frame: CGRectZero)
        self.view.addSubview(self.kejianTableview)
        // Do any additional setup after loading the view.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let checkBtn = UIButton()
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        checkBtn.frame = CGRectMake(0, 10, 70, 30)
        checkBtn.frame.origin.x = self.view.bounds.width - 80
        checkBtn.backgroundColor = UIColor(red: 255/255, green: 130/255, blue: 4/255, alpha: 1)
        checkBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        checkBtn.setTitle("查看", forState: .Normal)
        checkBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        checkBtn.layer.cornerRadius = 5
        checkBtn.layer.masksToBounds = true
        cell.textLabel?.text = "语文课课件"
        cell.contentView.addSubview(checkBtn)
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
