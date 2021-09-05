//
//  ToDoList+CoreDataProperties.swift
//  ToDoApp
//
//  Created by Paul James on 05.09.2021.
//
//

import Foundation
import CoreData


extension ToDoList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoList> {
        return NSFetchRequest<ToDoList>(entityName: "ToDoList")
    }

    @NSManaged public var title: String?
    @NSManaged public var priority: Int32
    @NSManaged public var index: Int16

}

extension ToDoList : Identifiable {

}
