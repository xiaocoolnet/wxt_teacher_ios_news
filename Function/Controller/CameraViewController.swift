//
//  CameraViewController.swift
//  WXT_Teacher
//
//  Created by 李春波 on 16/3/16.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import YYWebImage

class CameraViewController: UIViewController, UICollectionViewDelegate, UIScrollViewDelegate, UICollectionViewDataSource {

    var titlename = String()
    var collectionView: UICollectionView?
    let cellIdentifier = "Cell"
    
    var remoteThumbImage = [NSURL(string: "http://img.1985t.com/uploads/previews/2015/08/0-KVoUKo.jpg"), NSURL(string: "http://img.1985t.com/uploads/previews/2015/08/0-dQCJkd.jpg"), NSURL(string: "http://imgs.gifxiu.net/upload/20150609/171753_3750.gif"), NSURL(string: "http://imgs.gifxiu.net/upload/20151104/210950_1093.gif")]
    
    //网络图片
    var remoteImage = [NSURL(string: "http://img.1985t.com/uploads/attaches/2015/08/45787-uWfw1o.jpg")!, NSURL(string: "http://img.1985t.com/uploads/attaches/2015/08/45770-iRuWwg.jpg")!, NSURL(string: "http://imgs.gifxiu.net/upload/20150609/171753_3750.gif")!, NSURL(string: "http://imgs.gifxiu.net/upload/20151104/210950_1093.gif")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = titlename
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical
        layout.headerReferenceSize = CGSize(width: self.view.frame.width, height: 10)
        let collectionViewFrame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height)
        collectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: layout)
        collectionView!.pagingEnabled = true
        collectionView!.directionalLockEnabled = true
        collectionView!.collectionViewLayout = layout
        collectionView?.backgroundColor = UIColor.whiteColor()
        collectionView!.delegate = self
        collectionView!.dataSource = self
        self.collectionView!.registerClass(PhotoBrowserCollectionCell.self, forCellWithReuseIdentifier: cellIdentifier)
        self.view.addSubview(collectionView!)
        // Do any additional setup after loading the view.
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var browser:PhotoBrowserView
        //网路数据源
        browser = PhotoBrowserView.initWithPhotos(withUrlArray: self.remoteImage)
        //类型为网络
        browser.sourceType = SourceType.REMOTE
        //设置展示哪张图片
        browser.index = indexPath.row
        //显示
        browser.show()
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return remoteThumbImage.count
    }
    
    //左右间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return CGFloat(1)
    }
    
    //    上下间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return CGFloat(5)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let placeHolder = UIImage(named: "placeholder.png")
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! PhotoBrowserCollectionCell
            let remoteUrl = remoteThumbImage[indexPath.row]
            cell.imageView.yy_setImageWithURL(remoteUrl, placeholder: placeHolder, options: YYWebImageOptions.SetImageWithFadeAnimation, completion: { (image, _, _, _, _) -> Void in
                if image == nil{
                    return
                }
            })
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
