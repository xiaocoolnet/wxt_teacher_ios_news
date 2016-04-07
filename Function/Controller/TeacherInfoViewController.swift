//
//  TeacherInfoViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/24.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class TeacherInfoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let teacherTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "教师风采"
        self.teacherTableView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
        self.teacherTableView.delegate = self
        self.teacherTableView.dataSource = self
        self.teacherTableView.tableFooterView = UIView(frame:CGRectZero)
        self.view.addSubview(self.teacherTableView)
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.selectionStyle = .None
        cell.accessoryType = .DisclosureIndicator
        cell.imageView?.image = UIImage(named: "教师风采-1")
        cell.textLabel?.text = "王老师"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //singleTeacherViewController
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        let single = singleTeacherViewController()
        single.title = cell?.textLabel?.text!
        self.navigationController?.pushViewController(single, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
