//
//  FangDiuViewController.swift
//  WXT_Teacher
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import CoreLocation

class FangDiuViewController: UIViewController,CLLocationManagerDelegate {

    //定位管理器
    let locationManager:CLLocationManager = CLLocationManager()
    
    var label1: UILabel!
    var label2: UILabel!
    var label3: UILabel!
    var label4: UILabel!
    var label5: UILabel!
    var label6: UILabel!
    var label7: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "防丢定位"
        self.view.backgroundColor = UIColor.whiteColor()
        
//        label1.frame = CGRectMake(100, 150, 150, 40)
//        label1.backgroundColor = UIColor.brownColor()
//        self.view.addSubview(label1)
        
        
        //设置定位服务管理器代理
        locationManager.delegate = self
        //设置定位进度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //更新距离
        locationManager.distanceFilter = 100
        ////发送授权申请
        locationManager.requestAlwaysAuthorization()
        if (CLLocationManager.locationServicesEnabled())
        {
            //允许使用定位服务的话，开启定位服务更新
            locationManager.startUpdatingLocation()
            print("定位开始")
        }
    }
    
    //定位改变执行，可以得到新位置、旧位置
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //获取最新的坐标
        let currLocation:CLLocation = locations.last!
        label1.text = "经度：\(currLocation.coordinate.longitude)"
        print("经度：\(currLocation.coordinate.longitude)")
        //获取纬度
        label2.text = "纬度：\(currLocation.coordinate.latitude)"
        //获取海拔
        label3.text = "海拔：\(currLocation.altitude)"
        //获取水平精度
        label4.text = "水平精度：\(currLocation.horizontalAccuracy)"
        //获取垂直精度
        label5.text = "垂直精度：\(currLocation.verticalAccuracy)"
        //获取方向
        label6.text = "方向：\(currLocation.course)"
        //获取速度
        label7.text = "速度：\(currLocation.speed)"
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
