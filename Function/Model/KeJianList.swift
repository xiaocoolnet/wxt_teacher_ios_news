//
//  KeJianList.swift
//  WXT_Teacher
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation


class KeJianList: JSONJoy {
    var objectlist: [KeJianInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<KeJianInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        //        status = decoder["status"].string
        objectlist = Array<KeJianInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(KeJianInfo(childs))
        }
    }
    
    func append(list: [KeJianInfo]){
        self.objectlist = list + self.objectlist
    }
}
class KeJianInfo: JSONJoy{
    var courseware_title:String?
    var courseware_content: String?
    var releasename:String?
    var courseware_time:String?
    
    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        courseware_title = decoder["courseware_title"].string
        courseware_content = decoder["courseware_content"].string
        releasename = decoder["releasename"].string
        courseware_time = decoder["courseware_time"].string
    }
    
}
