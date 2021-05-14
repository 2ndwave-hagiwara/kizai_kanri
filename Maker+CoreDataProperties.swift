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

}

extension Maker : Identifiable {

}
