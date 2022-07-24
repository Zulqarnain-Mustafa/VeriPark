//
//  SaveReadingsViewController.swift
//  VeriParkTest
//
//  Created by Zulqarnain Mustafa on 24/07/2022.
//

import UIKit
import RealmSwift

let SLAB_ONE_RATE = 5
let SLAB_TWO_RATE = 8
let SLAB_THREE_RATE = 10

struct Slab {
    var units: Int!
    var cost: Int!
    var slabRate: Int!
}


class SaveReadingsViewController: UIViewController {
    @IBOutlet weak var historicalRecordTableView: HistoricalReadingsTableView!
    
    @IBOutlet weak var slabTableView: SlabTableView!
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var totalUnitsLabel: UILabel!
    var currentCustomer: Customer?
    var enteredReading = 0
    
    var currentReading = 0
    var calculatedCost = 0
    
    var slabArray = [Slab]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.historicalRecordTableView.tableArray = Array(self.currentCustomer?.meterReadings ?? List<MeterReading>()).suffix(3)
        self.historicalRecordTableView.reloadData()
        
        self.calculateCost()
    }
    

    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func saveAction(_ sender: Any) {
        
        
        let reading             = MeterReading()
        reading.readingId       = Int.random(in: 1..<1000) + calculatedCost
        reading.reading         = self.enteredReading
        reading.calculatedCost  = calculatedCost
        reading.unitsConsumption = currentReading
        reading.readingDate     = Date()
        
        RealmLayer.shared.updateCustomer(customer: self.currentCustomer!, reading: reading)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func calculateCost() {
        
        self.currentReading =  self.enteredReading - (self.currentCustomer?.meterReadings.last?.reading ?? 0)
        
        
        
        if currentReading <= 100 {
             calculatedCost = currentReading * SLAB_ONE_RATE
            
            let slab = Slab(units: currentReading, cost: calculatedCost, slabRate: SLAB_ONE_RATE)
            
            self.slabArray.append(slab)
            
        }else if currentReading > 100 && currentReading <= 500 {
            
            let slot1 = 100
            let slot2 = currentReading - 100
            
            let slot1Cost = slot1 * SLAB_ONE_RATE
            let slot2Cost = slot2 * SLAB_TWO_RATE
            
             calculatedCost = slot1Cost + slot2Cost
            
            let slab1 = Slab(units: slot1, cost: slot1Cost, slabRate: SLAB_ONE_RATE)
            let slab2 = Slab(units: slot2, cost: slot2Cost, slabRate: SLAB_TWO_RATE)
            
            self.slabArray.append(slab1)
            self.slabArray.append(slab2)
            
        }else {
            let slot1 = 100
            let slot2 = 400
            let slot3 = currentReading - 500
            
            let slot1Cost = slot1 * SLAB_ONE_RATE
            let slot2Cost = slot2 * SLAB_TWO_RATE
            let slot3Cost = slot3 * SLAB_THREE_RATE
            
             calculatedCost = slot1Cost + slot2Cost + slot3Cost
            
            let slab1 = Slab(units: slot1, cost: slot1Cost, slabRate: SLAB_ONE_RATE)
            let slab2 = Slab(units: slot2, cost: slot2Cost, slabRate: SLAB_TWO_RATE)
            let slab3 = Slab(units: slot3, cost: slot3Cost, slabRate: SLAB_THREE_RATE)
            
            self.slabArray.append(slab1)
            self.slabArray.append(slab2)
            self.slabArray.append(slab3)
            
        }
        
        self.totalCostLabel.text = "$\(self.calculatedCost)"
        self.totalUnitsLabel.text = "\(self.currentReading)"
        
        self.slabTableView.tableArray = self.slabArray
        self.slabTableView.reloadData()
        
        
    }
    

}
