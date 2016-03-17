//
//  bbKaoQinViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/13.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//


import UIKit

class bbKaoQinViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    var avatorCollection : UICollectionView!
    var flowLayout = UICollectionViewFlowLayout()
    var timeView = UIView()
    let lastDayBtn = UIButton()
    let nextDayBtn = UIButton()
    let timeLabel = UILabel()
    let lastMonthBtn = UIButton()
    let nextMonthBtn = UIButton()
    let sumCount = UILabel()
    let shiDaoCount = UILabel()
    let qingJiaCount = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "宝宝考勤"
        self.view.backgroundColor = UIColor.whiteColor()
        self.tabBarController?.tabBar.hidden = true
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical
        print(UIScreen.mainScreen().bounds.width)
        avatorCollection = UICollectionView(frame: CGRectMake(0, 124, UIScreen.mainScreen().bounds.width, self.view.bounds.height), collectionViewLayout: flowLayout)
        avatorCollection!.delegate = self
        avatorCollection!.dataSource = self
        avatorCollection!.alwaysBounceVertical = true
        timeView.frame = CGRectMake(0, 94, self.view.bounds.width, 20)
        timeView.backgroundColor = UIColor.whiteColor()
        avatorCollection!.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        avatorCollection.contentSize = CGSizeMake(100, 100)
        avatorCollection!.registerClass(AvatorCollectionViewCell.self, forCellWithReuseIdentifier: "AvatorCell")
        self.lastDayBtn.frame = CGRectMake(50, 70, 20, 20)
        self.lastDayBtn.setImage(UIImage(named: "上一天"), forState: .Normal)
        self.lastDayBtn.addTarget(self, action: Selector("LastDay"), forControlEvents: .TouchUpInside)
        self.nextDayBtn.frame = CGRectMake(0, 70, 20, 20)
        self.nextDayBtn.frame.origin.x = self.view.bounds.width - 70
        self.nextDayBtn.setImage(UIImage(named: "下一天"), forState: .Normal)
        self.nextDayBtn.addTarget(self, action: Selector("NextDay"), forControlEvents: .TouchUpInside)
        self.lastMonthBtn.frame = CGRectMake(30, 70, 20, 20)
        self.lastMonthBtn.setImage(UIImage(named: "上个月"), forState: .Normal)
        self.lastMonthBtn.addTarget(self, action: Selector("LastMonth"), forControlEvents: .TouchUpInside)
        self.nextMonthBtn.frame = CGRectMake(0, 70, 20, 20)
        self.nextMonthBtn.setImage(UIImage(named: "下个月"), forState: .Normal)
        self.nextMonthBtn.frame.origin.x = self.view.bounds.width - 50
        self.nextMonthBtn.addTarget(self, action: Selector("NextMonth"), forControlEvents: .TouchUpInside)
        self.timeLabel.frame = CGRectMake(0, 70, 150, 20)
        self.timeLabel.textColor = UIColor.grayColor()
        self.timeLabel.center.x = self.view.center.x
        self.timeLabel.font = UIFont.systemFontOfSize(15)
        self.sumCount.frame = CGRectMake(0, 100, 69, 20)
        self.sumCount.textColor = UIColor.grayColor()
        self.sumCount.center.x = self.view.bounds.width/6
        self.sumCount.font = UIFont.systemFontOfSize(15)
        self.sumCount.text = "总人数:15"
        self.sumCount.textAlignment = .Center
        self.shiDaoCount.frame = CGRectMake(0, 100, 85, 20)
        self.shiDaoCount.textColor = UIColor.grayColor()
        self.shiDaoCount.center.x = self.view.center.x
        self.shiDaoCount.font = UIFont.systemFontOfSize(15)
        self.shiDaoCount.text = "实到人数:15"
        self.shiDaoCount.textAlignment = .Center
        self.qingJiaCount.frame = CGRectMake(0, 100, 75, 20)
        self.qingJiaCount.textColor = UIColor.grayColor()
        self.qingJiaCount.center.x = self.view.bounds.width/6*5
        self.qingJiaCount.font = UIFont.systemFontOfSize(15)
        self.qingJiaCount.text = "请假人数:0"
        self.qingJiaCount.textAlignment = .Center
        let today:NSDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd  EEEE"
        let allday = dateFormatter.stringFromDate(today)
        timeLabel.text = allday
        self.view.addSubview(self.timeView)
        self.view.addSubview(self.timeLabel)
        self.view.addSubview(self.nextMonthBtn)
        self.view.addSubview(self.lastMonthBtn)
        self.view.addSubview(self.nextDayBtn)
        self.view.addSubview(self.lastDayBtn)
        self.view.addSubview(self.qingJiaCount)
        self.view.addSubview(self.shiDaoCount)
        self.view.addSubview(self.sumCount)
        self.view.addSubview(avatorCollection!)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:AvatorCollectionViewCell  = avatorCollection!.dequeueReusableCellWithReuseIdentifier("AvatorCell", forIndexPath: indexPath) as! AvatorCollectionViewCell
        cell.photo.frame = CGRectMake(0,0,50,50)
        cell.photo.image = UIImage(named: "宝宝头像")
        cell.photo.layer.cornerRadius = 25
        cell.photo.layer.masksToBounds = true
        cell.nameLabel.frame = CGRectMake(0, 50, 50, 15)
        cell.nameLabel.font = UIFont.systemFontOfSize(12)
        cell.nameLabel.textAlignment = .Center
        cell.nameLabel.text = "小红"
        cell.flag.frame = CGRectMake(30, 0, 20, 20)
        cell.flag.image = UIImage(named: "入园")
        cell.contentView.addSubview(cell.nameLabel)
        cell.contentView.addSubview(cell.photo)
        cell.contentView.addSubview(cell.flag)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        return CGSizeMake(50,65)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
    
    func NextDay(){
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd  EEEE"
        let stringday = dateFormatter.dateFromString(self.timeLabel.text!)
        let theDayAfterTomorrow = stringday!.dateByAddingTimeInterval(24*60*60)
        let tomorrow = dateFormatter.stringFromDate(theDayAfterTomorrow)
        timeLabel.text = tomorrow
    }
    
    func LastDay(){
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd  EEEE"
        let stringday = dateFormatter.dateFromString(self.timeLabel.text!)
        let theYesterday = stringday!.dateByAddingTimeInterval(-24*60*60)
        let yesterday = dateFormatter.stringFromDate(theYesterday)
        timeLabel.text = yesterday
    }
    
    func LastMonth(){
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd  EEEE"
        let stringday = dateFormatter.dateFromString(self.timeLabel.text!)
        let theLastMonth = stringday!.dateByAddingTimeInterval(-24*60*60*30)
        let lastMonth = dateFormatter.stringFromDate(theLastMonth)
        timeLabel.text = lastMonth
    }
    
    func NextMonth(){
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd  EEEE"
        let stringday = dateFormatter.dateFromString(self.timeLabel.text!)
        let theNextMonth = stringday!.dateByAddingTimeInterval(24*60*60*30)
        let nextMonth = dateFormatter.stringFromDate(theNextMonth)
        timeLabel.text = nextMonth
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
