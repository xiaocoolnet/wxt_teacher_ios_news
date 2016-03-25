//
//  XinWenListViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/25.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class XinWenListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let XinWenList = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "新闻列表"
        XinWenList.delegate = self
        XinWenList.dataSource = self
        XinWenList.tableFooterView = UIView(frame: CGRectZero)
        self.view.addSubview(XinWenList)
        // Do any additional setup after loading the view.
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
        cell.imageView?.image = UIImage(named: "teacherPic")
        cell.textLabel?.text = "新闻标题"
        cell.textLabel?.frame.origin.y = 5
        return cell
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
