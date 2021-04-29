//
//  Questions+CoreDataProperties.swift
//  Asses Me
//
//  Created by Fahmi Dzulqarnain on 28/04/21.
//
//

import Foundation
import CoreData


extension Questions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Questions> {
        return NSFetchRequest<Questions>.init(entityName: "Questions")
    }
    
    @nonobjc public class func fetchRequestMagnitude(_ id_challenge: Int) -> NSFetchRequest<Questions> {
        let predicate1 = NSPredicate(format: "category == %@", "magnitude")
        let predicate2 = NSPredicate(format: "id_challenge == %@", String(id_challenge))
        let predicate = NSCompoundPredicate.init(type: .and, subpredicates: [predicate1,predicate2])

        let fetchRequest = NSFetchRequest<Questions>.init(entityName: "Questions")
        fetchRequest.predicate = predicate

        return fetchRequest
    }
    
    @nonobjc public class func fetchRequestGenerality(_ id_challenge: Int) -> NSFetchRequest<Questions> {
        let predicate1 = NSPredicate(format: "category == %@", "generality")
        let predicate2 = NSPredicate(format: "id_challenge == %@", String(id_challenge))
        let predicate = NSCompoundPredicate.init(type: .and, subpredicates: [predicate1,predicate2])

        let fetchRequest = NSFetchRequest<Questions>.init(entityName: "Questions")
        fetchRequest.predicate = predicate

        return fetchRequest
    }
    
    @nonobjc public class func fetchRequestStrength(_ id_challenge: Int) -> NSFetchRequest<Questions> {
        let predicate1 = NSPredicate(format: "category == %@", "strength")
        let predicate2 = NSPredicate(format: "id_challenge == %@", String(id_challenge))
        let predicate = NSCompoundPredicate.init(type: .and, subpredicates: [predicate1,predicate2])

        let fetchRequest = NSFetchRequest<Questions>.init(entityName: "Questions")
        fetchRequest.predicate = predicate

        return fetchRequest
    }

    @NSManaged public var id_challenge: Int16
    @NSManaged public var category: String?
    @NSManaged public var question: String?

}

extension Questions : Identifiable {

}
