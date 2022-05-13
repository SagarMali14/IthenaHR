//
//  Employee+CoreDataProperties.swift
//  HRProject
//
//  Created by Gaurav on 12/05/22.
//  Copyright © 2022 Felix IT. All rights reserved.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var emailId: String?
    @NSManaged public var phoneNo: String?
    @NSManaged public var technology: String?

}
