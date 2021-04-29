//
//  Feedbacks+CoreDataProperties.swift
//  Asses Me
//
//  Created by Fahmi Dzulqarnain on 28/04/21.
//
//

import Foundation
import CoreData


extension Feedbacks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Feedbacks> {
        return NSFetchRequest<Feedbacks>(entityName: "Feedbacks")
    }

    @NSManaged public var id: Int16
    @NSManaged public var feedback: String?
    @NSManaged public var source: String?
    @NSManaged public var condition: Int16

}

extension Feedbacks : Identifiable {

}
