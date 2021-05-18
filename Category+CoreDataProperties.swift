//
//  Category+CoreDataProperties.swift
//  kizai_kanri
//
//  Created by 仲吉一馬 on 2021/05/14.
//  Copyright © 2021 hagiwara. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var categoryName: String?
    @NSManaged public var equipments: NSSet?

}

// MARK: Generated accessors for equipments
extension Category {

    @objc(addEquipmentsObject:)
    @NSManaged public func addToEquipments(_ value: Equipment)

    @objc(removeEquipmentsObject:)
    @NSManaged public func removeFromEquipments(_ value: Equipment)

    @objc(addEquipments:)
    @NSManaged public func addToEquipments(_ values: NSSet)

    @objc(removeEquipments:)
    @NSManaged public func removeFromEquipments(_ values: NSSet)

}

extension Category : Identifiable {

}
