//
//  ChengZhangViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/11.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class ChengZhangViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating {

    let nameTableView = UITableView()
    let search = UISearchBar()
    var ctrls:[String] = ["王小明","刘帅","李斯","张震","李太"]
    var searchResults = [String]()
    var searchController:UISearchController!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "学生档案"
        self.automaticallyAdjustsScrollViewInsets = false
        nameTableView.delegate = self
        nameTableView.dataSource = self
        nameTableView.frame = CGRectMake(0, 64, self.view.bounds.width, self.view.bounds.height - 64)
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.frame = CGRectMake(0, 0, self.view.bounds.width, 44)
        definesPresentationContext = true
        nameTableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.placeholder = "输入学生姓名关键字"
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        self.view.addSubview(nameTableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.searchResults.count != 0{
            return self.searchResults.count
        }
        return self.ctrls.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
