//
//  DaibanxiangqingViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/23.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class DaibanxiangqingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let newsInfoTableView = UITableView()
    var newsInfo = NewsInfo()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "事件详情"
        newsInfoTableView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
        self.view.backgroundColor = UIColor.whiteColor()
        newsInfoTableView.delegate = self
        newsInfoTableView.dataSource = self
        newsInfoTableView.scrollEnabled = false
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(newsInfoTableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.view.bounds.height - 10 - 64
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let contentLabel = UILabel()
        let content = UILabel()
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "InfoCell")
        cell.selectionStyle = .None
        let options : NSStringDrawingOptions = NSStringDrawingOptions.UsesLineFragmentOrigin
        let string:NSString = "书山有路勤为径，学海无涯苦作舟！"
        let screenBounds:CGRect = UIScreen.mainScreen().bounds
        let boundingRect = string.boundingRectWithSize(CGSizeMake(screenBounds.width - 30, 0), options: options, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(17)], context: nil)
        contentLabel.frame = CGRectMake(15, 30, 100, 25)
        contentLabel.font = UIFont.systemFontOfSize(20)
        contentLabel.textColor = UIColor.grayColor()
        contentLabel.text = "消息详情:"
        content.frame = CGRectMake(15, 60, self.view.bounds.width - 30, boundingRect.height)
        content.font = UIFont.systemFontOfSize(16)
        content.textColor = UIColor.blackColor()
        
        content.text = string as String
        
        content.numberOfLines = 0
        cell.contentView.addSubview(contentLabel)
        cell.contentView.addSubview(content)
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
