//
//  HuoDongXqViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/21.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class HuoDongXqViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let imageHeader = UIImageView()
    let nameView = UIView()
    let timeView = UIView()
    let nameLabel = UILabel()
    let avatorImage = UIImageView()
    let timeLabel = UILabel()
    let logcationLabel = UILabel()
    let contentTableView = UITableView()
    let contentText = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        self.title = "活动详情"
        let rightItem = UIBarButtonItem(title:"编辑",style: .Done,target: self,action: #selector(HuoDongXqViewController.EditKejian))
        self.navigationItem.rightBarButtonItem = rightItem
        
        imageHeader.frame = CGRectMake(0, 0, self.view.bounds.width, 150)
        imageHeader.image = UIImage(named: "活动图片")
        nameView.frame = CGRectMake(10, 130, self.view.bounds.width - 20, 60)
        timeView.frame = CGRectMake(10, 191, self.view.bounds.width - 20, 40)
        nameView.backgroundColor = UIColor.whiteColor()
        timeView.backgroundColor = UIColor.whiteColor()
        nameLabel.frame = CGRectMake(55, 23, 160, 14)
        nameLabel.text = "苗壮幼儿园亲子运动会"
        nameLabel.textColor = UIColor.blackColor()
        nameLabel.font = UIFont.systemFontOfSize(14)
        avatorImage.image = UIImage(named: "Huodongavator")
        avatorImage.frame = CGRectMake(10, 10, 40, 40)
        timeLabel.frame = CGRectMake(5, 10, 151, 15)
        timeLabel.textColor = UIColor.grayColor()
        timeLabel.text = "活动日期:2016年3月11日"
        timeLabel.font = UIFont.systemFontOfSize(13)
        logcationLabel.frame = CGRectMake(0, 10, 103, 15)
        logcationLabel.frame.origin.x = self.view.bounds.width - 103 - 10 - 11
        logcationLabel.font = UIFont.systemFontOfSize(13)
        logcationLabel.textColor = UIColor.grayColor()
        logcationLabel.text = "地点:壮苗幼儿园"
        contentTableView.frame = CGRectMake(10, 240, self.view.bounds.width - 20, 300)
        contentTableView.delegate = self
        contentTableView.dataSource = self
        contentTableView.tableFooterView = UIView(frame: CGRectZero)
        self.view.addSubview(imageHeader)
        self.view.addSubview(nameView)
        self.view.addSubview(timeView)
        self.nameView.addSubview(nameLabel)
        self.nameView.addSubview(avatorImage)
        self.timeView.addSubview(timeLabel)
        self.timeView.addSubview(logcationLabel)
        self.view.addSubview(contentTableView)
        
        // Do any additional setup after loading the view.
    }
    
    func EditKejian(){
        self.contentText.editable = true
        let rightItem = UIBarButtonItem(title: "保存", style: .Done, target: self, action: #selector(HuoDongXqViewController.SaveKejian))
        self.navigationItem.rightBarButtonItem = rightItem
        
        print("保存")
    }
    
    func SaveKejian(){
        self.contentText.editable = false
        let rightItem = UIBarButtonItem(title: "编辑", style: .Done, target: self, action: #selector(KeJianInfoViewController.EditKejian))
        self.navigationItem.rightBarButtonItem = rightItem
        
        
        
        
        print("编辑")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 45
        }
        if indexPath.row == 1{
            return 255
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let titleLabel = UILabel()
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.selectionStyle = .None
        if indexPath.row == 0{
            titleLabel.frame = CGRectMake(5, 12, 70, 16)
            titleLabel.font = UIFont.systemFontOfSize(17)
            titleLabel.text = "活动内容"
            cell.contentView.addSubview(titleLabel)
            return cell
        }
        contentText.frame = CGRectMake(5, 2, self.contentTableView.bounds.width - 10, 200)
        contentText.font = UIFont.systemFontOfSize(15)
        contentText.textColor = UIColor.grayColor()
        contentText.text = "活动内容活动内容活动内容活动内容"
        contentText.editable = false
        cell.contentView.addSubview(contentText)
        
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
