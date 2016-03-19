
//
//  ShiPuViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/19.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class ShiPuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let dataTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "每周食谱"
        self.view.backgroundColor = UIColor.whiteColor()
        self.dataTableView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height - 64)
        self.dataTableView.delegate = self
        self.dataTableView.dataSource = self
        self.dataTableView.tableFooterView = UIView(frame: CGRectZero)
        self.automaticallyAdjustsScrollViewInsets = false
        self.tabBarController?.tabBar.hidden = true
        self.view.addSubview(self.dataTableView)
        // Do any additional setup after loading the view.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        if(section == 0){
            let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
            let label = UILabel(frame: CGRectMake(5, 1, tableView.frame.size.width, 18))
            label.font = UIFont.systemFontOfSize(12)
            label.text = "周一"
            label.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
            view.addSubview(label)
            view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
            return view
        }
        if(section == 1){
            let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
            let label = UILabel(frame: CGRectMake(5, 1, tableView.frame.size.width, 18))
            label.font = UIFont.systemFontOfSize(12)
            label.text = "周二"
            label.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
            view.addSubview(label)
            view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
            return view
        }
        if(section == 2){
            let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
            let label = UILabel(frame: CGRectMake(5, 1, tableView.frame.size.width, 18))
            label.font = UIFont.systemFontOfSize(12)
            label.text = "周三"
            label.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
            view.addSubview(label)
            view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
            return view
        }
        if(section == 3){
            let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
            let label = UILabel(frame: CGRectMake(5, 1, tableView.frame.size.width, 18))
            label.font = UIFont.systemFontOfSize(12)
            label.text = "周四"
            label.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
            view.addSubview(label)
            view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
            return view
        }
        let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
        let label = UILabel(frame: CGRectMake(5, 1, tableView.frame.size.width, 18))
        label.font = UIFont.systemFontOfSize(12)
        label.text = "周五"
        label.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
        view.addSubview(label)
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        return view
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let contentlabel = UILabel()
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        contentlabel.frame = CGRectMake(10, 5, self.view.bounds.width - 10, 40)
        contentlabel.numberOfLines = 0
        contentlabel.font = UIFont.systemFontOfSize(16)
        contentlabel.text = "食谱1号"
        cell.contentView.addSubview(contentlabel)
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
