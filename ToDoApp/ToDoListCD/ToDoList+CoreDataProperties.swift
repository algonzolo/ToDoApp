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

}

extension ToDoList : Identifiable {

}
