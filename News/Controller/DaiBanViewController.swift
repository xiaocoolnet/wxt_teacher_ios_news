//
//  DaiBanViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/23.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class DaiBanViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let DaiBanTableView = UITableView()
    var newsInfo = NewsInfo()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "待办事宜"
        DaiBanTableView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height - 64)
        DaiBanTableView.delegate = self
        DaiBanTableView.dataSource = self
        DaiBanTableView.tableFooterView = UIView(frame: CGRectZero)
        let rightItem = UIBarButtonItem(title: "新增", style: UIBarButtonItemStyle.Done, target: self, action: Selector(""))
        self.navigationItem.rightBarButtonItem = rightItem
        self.view.addSubview(DaiBanTableView)
        // Do any additional setup after loading the view.
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
        cell.textLabel?.font = UIFont.systemFontOfSize(15)
        cell.textLabel?.text = "联系家长"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let Ddxq = DaibanxiangqingViewController()
        self.navigationController?.pushViewController(Ddxq, animated: true)
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
