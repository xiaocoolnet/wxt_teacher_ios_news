//
//  PhotoViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/9.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    
    var photoCollection : UICollectionView!
    var flowLayout = UICollectionViewFlowLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "班级相册"
        self.view.backgroundColor = UIColor.grayColor()
        self.tabBarController?.tabBar.hidden = true
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical
        print(UIScreen.mainScreen().bounds.width)
        photoCollection = UICollectionView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, self.view.bounds.height), collectionViewLayout: flowLayout)
        photoCollection!.delegate = self
        photoCollection!.dataSource = self
        photoCollection!.alwaysBounceVertical = true
        photoCollection!.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        photoCollection.contentSize = CGSizeMake(100, 100)
        photoCollection!.registerClass(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell")
        let rightItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(PhotoViewController.NewPhoto))
        self.navigationItem.rightBarButtonItem = rightItem
        self.view.addSubview(photoCollection!)
    }
    
    func NewPhoto(){
        let newPhoto = NewPhotoViewController()
        self.navigationController?.pushViewController(newPhoto, animated: true)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:PhotoCollectionViewCell  = photoCollection!.dequeueReusableCellWithReuseIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotoCollectionViewCell
        cell.contentView.backgroundColor = UIColor.whiteColor()
        cell.photo.frame = CGRectMake(0,0,110,100)
        cell.photo.image = UIImage(named:"photoboy")
        cell.nameLabel.frame = CGRectMake(0, 100, 100, 20)
        cell.nameLabel.font = UIFont.systemFontOfSize(12)
        cell.nameLabel.textAlignment = .Left
        cell.nameLabel.text = "小二班班级相册"
        cell.countLabel.frame = CGRectMake(0, 100, 15, 20)
        cell.countLabel.frame.origin.x = cell.contentView.bounds.width - 15
        cell.countLabel.textAlignment = .Left
        cell.countLabel.font = UIFont.systemFontOfSize(12)
        cell.countLabel.text = "10"
        cell.timeLabel.frame = CGRectMake(0, 85, 110, 15)
        cell.timeLabel.textColor = UIColor.whiteColor()
        cell.timeLabel.textAlignment = .Right
        cell.timeLabel.text = "2016-1-2"
        cell.timeLabel.font = UIFont.systemFontOfSize(12)
        cell.timeLabel.backgroundColor = UIColor.blackColor()
        cell.timeLabel.alpha =  0.5
        cell.contentView.addSubview(cell.countLabel)
        cell.contentView.addSubview(cell.nameLabel)
        cell.contentView.addSubview(cell.photo)
        cell.contentView.addSubview(cell.timeLabel)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        return CGSizeMake(110,120)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let camera = CameraViewController()
        camera.titlename = "小二班班级相册"
        self.navigationController?.pushViewController(camera, animated: true)
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
