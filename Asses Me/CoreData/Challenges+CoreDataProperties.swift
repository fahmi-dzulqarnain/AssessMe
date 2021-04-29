//
//  Challenges+CoreDataProperties.swift
//  Asses Me
//
//  Created by Fahmi Dzulqarnain on 29/04/21.
//
//

import Foundation
import CoreData


extension Challenges {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Challenges> {
        return NSFetchRequest<Challenges>(entityName: "Challenges")
    }

    @NSManaged public var descrip: String?
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var score: Int16
    @NSManaged public var progress: String?
    @NSManaged public var isTested: Bool

}

extension Challenges : Identifiable {

}
