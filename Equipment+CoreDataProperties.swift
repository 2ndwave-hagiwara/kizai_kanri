//
//  Equipment+CoreDataProperties.swift
//  kizai_kanri
//
//  Created by 仲吉一馬 on 2021/05/14.
//  Copyright © 2021 hagiwara. All rights reserved.
//
//

import Foundation
import CoreData


extension Equipment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Equipment> {
        return NSFetchRequest<Equipment>(entityName: "Equipment")
    }

    @NSManaged public var managementNumber: Int16
    @NSManaged public var modelName: String?
    @NSManaged public var equipmentType: String?
    @NSManaged public var usage: String?
    @NSManaged public var note: String?
    @NSManaged public var purchaseDate: Date?
    @NSManaged public var os: String?
    @NSManaged public var category: Category?
    @NSManaged public var user: User?
    @NSManaged public var maker: Maker?

}

extension Equipment : Identifiable {

}
