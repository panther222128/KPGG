//
//  MemberInfo+CoreDataClass.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/25.
//

import Foundation
import CoreData

@objc(MemberInfo)
public class MemberInfo: NSManagedObject, Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemberInfo> {
        return NSFetchRequest<MemberInfo>(entityName: "MemberInfo")
    }

    @NSManaged public var activityname: String?
    @NSManaged public var name: String?
    @NSManaged public var birth: String?
    @NSManaged public var mbti: String?
    @NSManaged public var bloodtype: String?
    @NSManaged public var mainimage: String?

}
