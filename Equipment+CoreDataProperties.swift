//
//  Equipment+CoreDataProperties.swift
//  kizai_kanri
//
//  Created by hagiwara on 2021/05/21.
//  Copyright © 2021 hagiwara. All rights reserved.
//
//

import Foundation
import CoreData


extension Equipment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Equipment> {
        return NSFetchRequest<Equipment>(entityName: "Equipment")
    }

    @NSManaged public var equipmentType: String?
    @NSManaged public var hostName: String?
    @NSManaged public var macAddress: String?
    @NSManaged public var managementNumber: String?
    @NSManaged public var modelName: String?
    @NSManaged public var note: String?
    @NSManaged public var os: String?
    @NSManaged public var purchaseDate: Date?
    @NSManaged public var usage: String?
    @NSManaged public var category: Category?
    @NSManaged public var equipment: NSSet?
    @NSManaged public var maker: Maker?
    @NSManaged public var user: User?

}

// MARK: Generated accessors for equipment
extension Equipment {

    @objc(addEquipmentObject:)
    @NSManaged public func addToEquipment(_ value: Equipment)

    @objc(removeEquipmentObject:)
    @NSManaged public func removeFromEquipment(_ value: Equipment)

    @objc(addEquipment:)
    @NSManaged public func addToEquipment(_ values: NSSet)

    @objc(removeEquipment:)
    @NSManaged public func removeFromEquipment(_ values: NSSet)

}

extension Equipment : Identifiable {

}
