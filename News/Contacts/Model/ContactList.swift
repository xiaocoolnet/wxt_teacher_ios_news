//
//  ContactList.swift
//  WXT_Teacher
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation


class ContactList: JSONJoy {
    var objectlist: [ContactsInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<ContactsInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        //        status = decoder["status"].string
        objectlist = Array<ContactsInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(ContactsInfo(childs))
        }
    }
    
    func append(list: [ContactsInfo]){
        self.objectlist = list + self.objectlist
    }
    
}
class ContactsInfo: JSONJoy{
    var classname:String?
    //    var objectlist: [TeachersInfo]
    //    var count: Int{
    //        return self.objectlist.count
    //    }
    init() {
        //objectlist = Array<TeachersInfo>()
    }
    required init(_ decoder: JSONDecoder){
        classname = decoder["classname"].string
        print("输出数据:\(classname)")
        //        objectlist = Array<TeachersInfo>()
        //        for childs: JSONDecoder in decoder.array!{
        //            objectlist.append(TeachersInfo(childs))
        //        }
    }
    
}
//class TeachersInfo: JSONJoy{
//    var name:String?
//
//    init() {
//
//    }
//    required init(_ decoder: JSONDecoder){
//        name = decoder["name"].string
//        print("输出数据:\(name)")
//    }
//
//}
