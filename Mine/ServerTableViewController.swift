//
//  ServerTableViewController.swift
//  WXT_Parents
//
//  Created by 李春波 on 16/2/16.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//


import UIKit

class ServerTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "在线客服"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let forFooterView = UIView(frame: CGRectMake(0, self.view.frame.size.width-49, self.view.frame.size.height, 49))
        let footerBt = UIButton(frame: CGRectMake(0, 0, self.view.frame.size.width, 49))
        forFooterView.addSubview(footerBt)
        
        footerBt.setTitle("拨打电话", forState: UIControlState.Normal)
        footerBt.backgroundColor = UIColor(red: 155.0/255.0, green: 229.0/255.0, blue: 180.0/255.0, alpha: 1.0)
        footerBt.addTarget(self, action:#selector(ServerTableViewController.call(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        return forFooterView
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 191
        }
        return 142
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 49
    }
    
    func call(sender:UIButton){
        let url1 = NSURL(string: "tel://4009660095")
        UIApplication.sharedApplication().openURL(url1!)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let questionLabel = UILabel()
        let answer1 = UILabel()
        let answer2 = UILabel()
        let answer3 = UILabel()
        let answer4 = UILabel()
        if(indexPath.row == 0){
            let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
            cell.selectionStyle = .None
            questionLabel.frame = CGRectMake(17, 10, 295, 21)
            questionLabel.font = UIFont.systemFontOfSize(14)
            questionLabel.textColor = UIColor(red: 201/255, green: 64/255, blue: 15/255, alpha: 1)
            questionLabel.text = "Q1 首次使用“一键洗车”，如何操作？"
            answer1.frame = CGRectMake(41, 36, 260, 34)
            answer1.font = UIFont.systemFontOfSize(13)
            answer1.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
            answer1.text = "1、获取验证码,登入;需添加车辆信息（后续使用可跳过步骤;"
            answer1.numberOfLines = 2
            answer2.frame = CGRectMake(41, 75, 260, 34)
            answer2.font = UIFont.systemFontOfSize(13)
            answer2.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
            answer2.text = "2.打开手机GPS定位功能,获取附近服务商信息,从中选择;"
            answer2.numberOfLines = 2
            answer3.frame = CGRectMake(41, 114, 260, 34)
            answer3.font = UIFont.systemFontOfSize(13)
            answer3.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
            answer3.text = "3.到店享受服务后，完成线上支付（可使用红包&洗车劵抵扣支付款）;"
            answer3.numberOfLines = 2
            answer4.frame = CGRectMake(41, 148, 260, 34)
            answer4.font = UIFont.systemFontOfSize(13)
            answer4.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
            answer4.text = "4.支付后可进行评价并领取分享红包。"
            answer4.numberOfLines = 2
            cell.contentView.addSubview(questionLabel)
            cell.contentView.addSubview(answer1)
            cell.contentView.addSubview(answer2)
            cell.contentView.addSubview(answer3)
            cell.contentView.addSubview(answer4)
            return cell
        }
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        return cell
    }
}
