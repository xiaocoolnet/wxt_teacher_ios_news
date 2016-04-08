//
//  BBKeTangViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/12.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
import XWSwiftRefresh

class BBKeTangViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var keBiaoSource = KeChengList()
    
    let lastDayBtn = UIButton()
    let nextDayBtn = UIButton()
    let timeLabel = UILabel()
    let lastMonthBtn = UIButton()
    let nextMonthBtn = UIButton()
    let weekLabel = UILabel()
    let ketangTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "宝宝课表"
        self.ketangTableView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height-40)
        self.ketangTableView.dataSource = self
        self.ketangTableView.delegate = self
        self.ketangTableView.tableFooterView = UIView(frame: CGRectZero)
        self.automaticallyAdjustsScrollViewInsets = false
        self.tabBarController?.tabBar.hidden = true
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.ketangTableView)
        // Do any additional setup after loading the view.
        
        self.DropDownUpdate()
        
    }
    
    func DropDownUpdate(){
        self.ketangTableView.headerView = XWRefreshNormalHeader(target: self, action: #selector(NewsViewController.GetDate))
        self.ketangTableView.reloadData()
        self.ketangTableView.headerView?.beginRefreshing()
    }
    
    func GetDate(){
        let url = apiUrl+"ClassSyllabus"
        let schoolid = 1
        let classid = 1
        
        let param = [
            "schoolid":schoolid,
            "classid":classid
            
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
                    self.keBiaoSource = KeChengList(status.data!)
                    self.ketangTableView.reloadData()
                    self.ketangTableView.headerView?.endRefreshing()
                    print("1")
                    print(self.keBiaoSource.count)
                }
            }
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
//        if section == 0{
//            return 5
//        }
//        if section == 1{
//            return 1
//        }
//        if section == 2{
//            return 2
//        }
//        if section == 3{
//            return 3
//        }
//        if section == 4{
//            return 1
//        }
        return keBiaoSource.count
        
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

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.selectionStyle = .None
        let keBiaoInfo = keBiaoSource.objectlist[indexPath.row]

//        if indexPath.section == 0{
//            let keBiaoInfo = keBiaoSource.objectlist[indexPath.row]
//
//            cell.textLabel?.text = "第\(indexPath.row + 1)节课: " + keBiaoInfo.syllabus_name!
//            return cell
//        }
//        if indexPath.section == 1{
//            let keBiaoInfo = keBiaoSource.objectlist[indexPath.row + 5]
//            
//            cell.textLabel?.text = "第\(indexPath.row + 1)节课: " + keBiaoInfo.syllabus_name!
//            return cell
//        }
//        if indexPath.section == 2{
//            let keBiaoInfo = keBiaoSource.objectlist[indexPath.row + 6]
//            
//            cell.textLabel?.text = "第\(indexPath.row + 1)节课: " + keBiaoInfo.syllabus_name!
//            return cell
//        }
//        if indexPath.section == 3{
//            let keBiaoInfo = keBiaoSource.objectlist[indexPath.row + 8]
//            
//            cell.textLabel?.text = "第\(indexPath.row + 1)节课: " + keBiaoInfo.syllabus_name!
//            return cell
//        }
//        if indexPath.section == 4{
//            let keBiaoInfo = keBiaoSource.objectlist[indexPath.row + 11]
//            
//            cell.textLabel?.text = "第\(indexPath.row + 1)节课: " + keBiaoInfo.syllabus_name!
//            return cell
//        }
        cell.textLabel?.text = "周 " + keBiaoInfo.syllabus_date! + " 第 " + keBiaoInfo.syllabus_no! + " 节课: " + keBiaoInfo.syllabus_name!

        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        if(section == 0){
            let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
            let label = UILabel(frame: CGRectMake(5, 1, tableView.frame.size.width, 18))
            label.font = UIFont.systemFontOfSize(12)
            label.text = "课程表"
            label.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
            view.addSubview(label)
            view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
            return view
        }
//        if(section == 1){
//            let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
//            let label = UILabel(frame: CGRectMake(5, 1, tableView.frame.size.width, 18))
//            label.font = UIFont.systemFontOfSize(12)
//            label.text = "星期二"
//            label.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
//            view.addSubview(label)
//            view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
//            return view
//        }
//        if(section == 2){
//            let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
//            let label = UILabel(frame: CGRectMake(5, 1, tableView.frame.size.width, 18))
//            label.font = UIFont.systemFontOfSize(12)
//            label.text = "星期三"
//            label.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
//            view.addSubview(label)
//            view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
//            return view
//        }
//        if(section == 3){
//            let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
//            let label = UILabel(frame: CGRectMake(5, 1, tableView.frame.size.width, 18))
//            label.font = UIFont.systemFontOfSize(12)
//            label.text = "星期四"
//            label.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
//            view.addSubview(label)
//            view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
//            return view
//        }
//        if(section == 4){
//            let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
//            let label = UILabel(frame: CGRectMake(5, 1, tableView.frame.size.width, 18))
//            label.font = UIFont.systemFontOfSize(12)
//            label.text = "星期五"
//            label.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
//            view.addSubview(label)
//            view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
//            return view
//        }
        return UIView(frame: CGRectZero)
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
