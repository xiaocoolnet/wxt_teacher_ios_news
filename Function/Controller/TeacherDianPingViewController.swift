//
//  TeacherDianPingViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/12.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class TeacherDianPingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let DianPingView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "点评记录"
        self.view.backgroundColor = UIColor.whiteColor()
        self.tabBarController?.tabBar.hidden = true
        DianPingView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
        DianPingView.dataSource = self
        DianPingView.delegate = self
        self.automaticallyAdjustsScrollViewInsets = false
        let emptyView = UIView()
        emptyView.frame = CGRectZero
        DianPingView.tableFooterView = emptyView
        let rightItem = UIBarButtonItem(title: "发表点评", style: .Done, target: self, action: #selector(TeacherDianPingViewController.FaBiao))
        self.navigationItem.rightBarButtonItem = rightItem
        DianPingView.registerClass(TeacherDianPingTableViewCell.self, forCellReuseIdentifier: "TDP")
        self.view.addSubview(DianPingView)
        // Do any additional setup after loading the view.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 114
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TDP", forIndexPath: indexPath) as! TeacherDianPingTableViewCell
        cell.avatorImage.image = UIImage(named: "老师点评-1")
        cell.nameLabel.text = "小红"
        cell.timeLabel.text = "今天14:17"
        let options : NSStringDrawingOptions = NSStringDrawingOptions.UsesLineFragmentOrigin
        let string:NSString = "孩子学习成绩很好"
        let screenBounds:CGRect = UIScreen.mainScreen().bounds
        let boundingRect = string.boundingRectWithSize(CGSizeMake(screenBounds.width, 0), options: options, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(15)], context: nil)
        cell.contentLabel.frame = CGRectMake(11, 54, self.view.bounds.width - 22, boundingRect.height)
        cell.contentLabel.text = "孩子学习成绩很好"
        return cell
    }
    
    func FaBiao(){
        print("")
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
