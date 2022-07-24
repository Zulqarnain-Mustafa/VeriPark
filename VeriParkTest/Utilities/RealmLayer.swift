//
//  RealmLayer.swift
//  VeriParkTest
//
//  Created by Zulqarnain Mustafa on 24/07/2022.
//

import Foundation
import Realm
import RealmSwift

class RealmLayer: NSObject {
    
    static let shared = RealmLayer()
    
    
    func getCustomers() -> [Customer] {
        let  realm = try! Realm()
        let resultArray = realm.objects(Customer.self)
        return Array(resultArray)
    }
    
    func saveCustomer(customer: Customer) {
        let  realm = try! Realm()
        
        try! realm.write {
            realm.add(customer, update: .all)
        }
    }
    
    func updateCustomer(customer: Customer, reading: MeterReading){
        let  realm = try! Realm()
        
        try! realm.write {
            customer.meterReadings.append(reading)
            realm.add(customer, update: .all)
        }
    }
    
    func getCustomer(by serviceNumber: String) -> Customer? {
        
        let realm = try! Realm()
        
        let customer = Array(realm.objects(Customer.self).filter("customerServiceNumber == %@", serviceNumber)).first
        
        return customer
    }
    
}
