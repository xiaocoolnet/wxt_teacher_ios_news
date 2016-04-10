//
//  YuErList.swift
//  WXT_Teacher
//
//  Created by xiaocool on 16/4/10.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation

class YuErList: JSONJoy {
    var objectlist: [YuErInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<YuErInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        //        status = decoder["status"].string
        objectlist = Array<YuErInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(YuErInfo(childs))
        }
    }
    
    func append(list: [YuErInfo]){
        self.objectlist = list + self.objectlist
    }
}
class YuErInfo: JSONJoy{
    var happy_title:String?
    var happy_content: String?
    var happy_pic:String?
    var releasename:String?
    var happy_time :String?
    
    
    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        happy_title = decoder["happy_title"].string
        happy_content = decoder["happy_content"].string
        happy_pic = decoder["happy_pic"].string
        releasename = decoder["releasename"].string
        happy_time = decoder["happy_time"].string
        
    }
    
}
