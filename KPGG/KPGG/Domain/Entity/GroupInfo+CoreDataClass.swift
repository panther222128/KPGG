//
//  GroupInfo+CoreDataClass.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/25.
//

import Foundation
import CoreData

@objc(GroupInfo)
public final class GroupInfo: NSManagedObject, Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroupInfo> {
        return NSFetchRequest<GroupInfo>(entityName: "GroupInfo")
    }

    @NSManaged public var groupname: String?
    @NSManaged public var grouplogo: String?
    @NSManaged public var groupimage: String?
    @NSManaged public var hitsong: String?
    @NSManaged public var haspreviousmember: Bool
    
}
