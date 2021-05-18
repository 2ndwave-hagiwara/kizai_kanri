//
//  Maker+CoreDataProperties.swift
//  kizai_kanri
//
//  Created by 仲吉一馬 on 2021/05/14.
//  Copyright © 2021 hagiwara. All rights reserved.
//
//

import Foundation
import CoreData


extension Maker {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Maker> {
        return NSFetchRequest<Maker>(entityName: "Maker")
    }

    @NSManaged public var makerName: String?
    @NSManaged public var equipments: NSSet?

}

// MARK: Generated accessors for equipments
extension Maker {

    @objc(addEquipmentsObject:)
    @NSManaged public func addToEquipments(_ value: Equipment)

    @objc(removeEquipmentsObject:)
    @NSManaged public func removeFromEquipments(_ value: Equipment)

    @objc(addEquipments:)
    @NSManaged public func addToEquipments(_ values: NSSet)

    @objc(removeEquipments:)
    @NSManaged public func removeFromEquipments(_ values: NSSet)

}

extension Maker : Identifiable {

}
