//
//  ZhouPlanViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/13.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
class ZhouPlanViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let zhouPlanTableView = UITableView()
    var planList = PlanList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //加载数据
        loadData()
        //加载视图
        loadSubviews()
        
    }
    
    
    //MARK: - 加载数据
    func loadData() -> Void {
        
        let url = teUrl+"m=school&a=getschoolplan"
        let schoolid = 30
        let type = 1
        
        let param = [
            "schoolid":schoolid,
            "type":type
            
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
                    print("0")
                }
                if(status.status == "success"){
                 print(status.data)
                    self.planList = PlanList(status.data!)
                    self.zhouPlanTableView.reloadData()
                    self.zhouPlanTableView.headerView?.endRefreshing()
                }
            }
        }

        
    }
    
    //MARK: - 加载视图
    func loadSubviews() -> Void {
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "周计划"
        self.zhouPlanTableView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
        self.zhouPlanTableView.dataSource = self
        self.zhouPlanTableView.delegate = self
        self.zhouPlanTableView.tableFooterView = UIView(frame: CGRectZero)
        self.automaticallyAdjustsScrollViewInsets = false
        self.tabBarController?.tabBar.hidden = true
        self.view.addSubview(self.zhouPlanTableView)
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.planList.objectlist.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let contentLabel = UILabel()
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.selectionStyle = .None
        cell.accessoryType = .DisclosureIndicator
        cell.textLabel?.text = "星期\(indexPath.row + 1)"
        contentLabel.frame = CGRectMake(102, 16, self.view.bounds.width - 102, 14)
        contentLabel.font = UIFont.systemFontOfSize(14)
        contentLabel.text = self.planList.objectlist[indexPath.row].plan_title
        contentLabel.textColor = UIColor.grayColor()
        cell.contentView.addSubview(contentLabel)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let edit = EditZhouPlanViewController()
        edit.plan = self.planList.objectlist[indexPath.row]
        self.navigationController?.pushViewController(edit, animated: true)
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
