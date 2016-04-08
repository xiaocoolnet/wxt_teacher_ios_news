
//
//  KeChengList.swift
//  WXT_Teacher
//
//  Created by apple on 16/4/8.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation

class KeChengList: JSONJoy {
    var objectlist: [KeChengInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<KeChengInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        //        status = decoder["status"].string
        objectlist = Array<KeChengInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(KeChengInfo(childs))
        }
    }
    
    func append(list: [KeChengInfo]){
        self.objectlist = list + self.objectlist
    }
}
class KeChengInfo: JSONJoy{
    var syllabus_date:String?
    var syllabus_name: String?
    var syllabus_no:String?
    
    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        syllabus_date = decoder["syllabus_date"].string
        syllabus_name = decoder["syllabus_name"].string
        syllabus_no = decoder["syllabus_no"].string
        
    }
    
}
