//
//  Customer.swift
//  VeriParkTest
//
//  Created by Zulqarnain Mustafa on 24/07/2022.
//

import Foundation
import Realm
import RealmSwift

class Customer: Object {

    @objc dynamic var customerServiceNumber: String?
    var meterReadings = List<MeterReading>()
    
    override static func primaryKey() -> String? {
        return "customerServiceNumber"
    }
}


