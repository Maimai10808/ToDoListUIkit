//
//  TaskModel+CoreDataProperties.swift
//  ToDoListUIkit
//
//  Created by mac on 7/13/25.
//
//

public import Foundation
public import CoreData


public typealias TaskModelCoreDataPropertiesSet = NSSet

extension TaskModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskModel> {
        return NSFetchRequest<TaskModel>(entityName: "TaskModel")
    }

    @NSManaged public var isComplete: Bool
    @NSManaged public var createdDate: Date?
    @NSManaged public var caption: String?
    @NSManaged public var category: String?

}

extension TaskModel : Identifiable {

}
