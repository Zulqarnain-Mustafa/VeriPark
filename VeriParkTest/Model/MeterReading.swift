//
//  MeterReading.swift
//  VeriParkTest
//
//  Created by Zulqarnain Mustafa on 24/07/2022.
//

import Foundation
import Realm
import RealmSwift

class MeterReading: Object {
    
    @objc dynamic var readingId = 0
    @objc dynamic var reading   = 0
    @objc dynamic var unitsConsumption   = 0
    @objc dynamic var calculatedCost   = 0
    @objc dynamic var readingDate: Date?
}
