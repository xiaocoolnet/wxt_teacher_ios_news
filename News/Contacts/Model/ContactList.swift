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
<<<<<<< HEAD
        var objectlist: [TeachersInfo]
        var count: Int{
            return self.objectlist.count
        }
    init() {
        objectlist = Array<TeachersInfo>()
=======
    var teacherlist: [TeacherInfo]
    var schoolname:String?
    var schoolid:String?
    var classid:String?
    
    var count: Int{
        return self.teacherlist.count
    }
    
    init() {
        teacherlist = Array<TeacherInfo>()
>>>>>>> origin/master
    }
    
    required init(_ decoder: JSONDecoder){
        classname = decoder["classname"].string
<<<<<<< HEAD
        print("输出数据:\(classname)")
                objectlist = Array<TeachersInfo>()
                for childs: JSONDecoder in decoder["teacherinfo"].array!{
                    objectlist.append(TeachersInfo(childs))
                }
    }
    
}
class TeachersInfo: JSONJoy{
    var name:String?

=======
        schoolname = decoder["schoolname"].string
        schoolid = decoder["schoolid"].string
        classid = decoder["classid"].string
        teacherlist = Array<TeacherInfo>()
        for teacher: JSONDecoder in decoder["teacherinfo"].array!{
            teacherlist.append(TeacherInfo(teacher))
        }
    }
    func append(list: [TeacherInfo]){
        self.teacherlist = list + self.teacherlist
    }
    
}
class TeacherInfo: JSONJoy{
    var name:String?
    var id: String?
    var phone: String?
>>>>>>> origin/master
    init() {

    }
    required init(_ decoder: JSONDecoder){
        name = decoder["name"].string
<<<<<<< HEAD
        print("输出数据:\(name)")
=======
        id = decoder["id"].string
        phone = decoder["phone"].string
>>>>>>> origin/master
    }

}
