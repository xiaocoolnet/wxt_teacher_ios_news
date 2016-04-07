//
//  TongGaoViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/29.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
import XWSwiftRefresh

class TongGaoListViewController:UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var TongGaoList = UITableView()
    var gongGaoSource = GongGaoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        TongGaoList.delegate = self
        TongGaoList.dataSource = self
        self.title = "公告列表"
        TongGaoList.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height - 64)
        TongGaoList.tableFooterView = UIView(frame: CGRectZero)
        self.view.addSubview(TongGaoList)
        // Do any additional setup after loading the view.
        
        self.DropDownUpdate()
    }
    
    func DropDownUpdate(){
        self.TongGaoList.headerView = XWRefreshNormalHeader(target: self, action: #selector(NewsViewController.GetDate))
        self.TongGaoList.reloadData()
        self.TongGaoList.headerView?.beginRefreshing()
    }
    
    func GetDate(){
        let url = apiUrl+"SchoolNotice"
        
        let param = [
            "schoolid":1
        ]
        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
            if(error != nil){
            }
            else{
                print("request是")
                print(request!)
                print("====================")
                let status = Http(JSONDecoder(json!))
                print("状态是")
                print(status.status)
                if(status.status == "error"){
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                }
                if(status.status == "success"){
                    self.gongGaoSource = GongGaoList(status.data!)
                    self.TongGaoList.reloadData()
                    self.TongGaoList.headerView?.endRefreshing()
                }
            }
        }
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(gongGaoSource.count)")
        return gongGaoSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.accessoryType = .DisclosureIndicator
        cell.selectionStyle = .None
        
        let gonggaoInfo = gongGaoSource.objectlist[indexPath.row]
        
        cell.imageView?.image = UIImage(named: "teacherPic")
        cell.textLabel?.text = gonggaoInfo.notice_title
        cell.textLabel?.frame.origin.y = 5
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let dataInfo = gongGaoSource.objectlist[indexPath.row]
        
        let teacherinfo = TongGaoInfoViewController()
        self.navigationController?.pushViewController(teacherinfo, animated: true)
        
        teacherinfo.contentLabel.text = dataInfo.notice_content
        teacherinfo.nameLabel.text = "教师：" + dataInfo.releasename!
        teacherinfo.timeLabel.text = "时间：" + dataInfo.notice_time!
        teacherinfo.noticeTitle.text = dataInfo.notice_title
        
    }
    
}
