//
//  TaskModel.swift
//  TaskIt
//
//  Created by Keenan Jaenicke on 1/14/15.
//  Copyright (c) 2015 Keenan Jaenicke. All rights reserved.
//

import Foundation
import CoreData

@objc(TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var task: String
    @NSManaged var subtask: String
    @NSManaged var completed: NSNumber
    @NSManaged var date: NSDate

}
