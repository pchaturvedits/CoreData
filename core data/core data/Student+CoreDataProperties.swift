//
//  Student+CoreDataProperties.swift
//  core data
//
//  Created by Manish Chaturvedi on 7/15/19.
//  Copyright © 2019 Manish Chaturvedi. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var city: String?
    @NSManaged public var mobile: String?

}
