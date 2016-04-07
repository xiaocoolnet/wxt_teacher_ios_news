//
//  DianPingListViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/30.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class DianPingListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating {
    
    let nameTableView = UITableView()
    let search = UISearchBar()
    var ctrls:[String] = ["王小明","刘帅","李斯","张震","李太"]
    var searchResults = [String]()
    var searchController:UISearchController!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "学生列表"
        nameTableView.delegate = self
        nameTableView.dataSource = self
        nameTableView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height - 64 - 44)
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.frame = CGRectMake(0, 0, self.view.bounds.width, 44)
        definesPresentationContext = true
        nameTableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.placeholder = "输入学生姓名关键字"
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        self.tabBarController?.tabBar.hidden = true
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(nameTableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.searchResults.count != 0{
            return self.searchResults.count
        }
        return self.ctrls.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
            cell.selectionStyle = .None
            cell.accessoryType = .DisclosureIndicator
            if searchResults.count != 0{
                print(searchResults.count)
                cell.textLabel?.text = searchResults[indexPath.row]
            }
            else{
                cell.textLabel?.text = self.ctrls[indexPath.row]
            }
            return cell
        }
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.selectionStyle = .None
        cell.accessoryType = .DisclosureIndicator
        if searchResults.count != 0{
            print(searchResults.count)
            cell.textLabel?.text = searchResults[indexPath.row]
        }
        else{
            cell.textLabel?.text = self.ctrls[indexPath.row]
        }
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if(section == 0){
            let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
            let label = UILabel(frame: CGRectMake(5, 1, tableView.frame.size.width, 18))
            label.font = UIFont.systemFontOfSize(12)
            label.text = "已经点评"
            label.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
            view.addSubview(label)
            view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
            return view
        }
            let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
            let label = UILabel(frame: CGRectMake(5, 1, tableView.frame.size.width, 18))
            label.font = UIFont.systemFontOfSize(12)
            label.text = "未点评"
            label.textColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
            view.addSubview(label)
            view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
            return view
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1{
            let dianPing = FaBiaoDianpingViewController()
            self.navigationController?.pushViewController(dianPing, animated: true)
        }
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchText = searchController.searchBar.text
        filterContentForSearchText(searchText!)
        self.nameTableView.reloadData()
    }
    
    func filterContentForSearchText(searchText: String) {
        searchResults = ctrls.filter({ ( name: String) -> Bool in
            let nameMatch = name.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return nameMatch != nil
        })
    }
}
