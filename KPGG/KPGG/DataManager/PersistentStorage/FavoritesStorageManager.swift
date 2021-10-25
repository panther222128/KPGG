//
//  FavoritesStorageManager.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/25.
//

import Foundation
import CoreData

class FavoritesStorageManager {
    
    static var shared: FavoritesStorageManager = FavoritesStorageManager()
    
    var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FavoritesStorage")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetch<T: NSManagedObject>(request: NSFetchRequest<T>) -> [T] {
        do {
            let fetchResult = try self.context.fetch(request)
            return fetchResult
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func insertGroup(group: Group) {
        let context = self.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "GroupInfo", in: context) else { return }
        let groupManagedObject = NSManagedObject(entity: entity, insertInto: context)
        groupManagedObject.setValue(group.groupname, forKey: "groupname")
        groupManagedObject.setValue(group.grouplogo, forKey: "grouplogo")
        groupManagedObject.setValue(group.groupimage, forKey: "groupimage")
        groupManagedObject.setValue(group.hitsong, forKey: "hitsong")
        groupManagedObject.setValue(group.haspreviousmember, forKey: "haspreviousmember")
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func insertMember(member: Member) {
        let context = self.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "MemberInfo", in: context) else { return }
        let memberManagedObject = NSManagedObject(entity: entity, insertInto: context)
        memberManagedObject.setValue(member.activityname, forKey: "activityname")
        memberManagedObject.setValue(member.name, forKey: "name")
        memberManagedObject.setValue(member.birth, forKey: "birth")
        memberManagedObject.setValue(member.mbti, forKey: "mbti")
        memberManagedObject.setValue(member.bloodtype, forKey: "bloodtype")
        memberManagedObject.setValue(member.mainimage, forKey: "mainimage")
        memberManagedObject.setValue(member.ispreviousmember, forKey: "ispreviousmember")
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func delete(object: NSManagedObject) {
        self.context.delete(object)
        do {
            try self.context.save()
        } catch {
            
        }
    }
    
}
