//
//  ViewController.swift
//  VeriParkTest
//
//  Created by Zulqarnain Mustafa on 24/07/2022.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var serviceNumberTextField:       ZMTextField!
    @IBOutlet weak var meterReadingTextField:       ZMTextField!
    
    var selectedCustomer: Customer?
    var enteredReading = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        if RealmLayer.shared.getCustomers().isEmpty {
            let customer1 = Customer()
            
            customer1.customerServiceNumber = "HA123"
            
            let customer2 = Customer()
            
            customer2.customerServiceNumber = "HA456"
            
            RealmLayer.shared.saveCustomer(customer: customer1)
            RealmLayer.shared.saveCustomer(customer: customer2)
        }
        
    }

    
    func isValidData() -> Bool {
        
        if (self.serviceNumberTextField.text ?? "").trimmingCharacters(in: .whitespaces).isEmpty {
            self.showSimpleAlert(title: "Alert!", message: "Please enter a valid service number.")
            return false
        }
    
        if (self.meterReadingTextField.text ?? "").trimmingCharacters(in: .whitespaces).isEmpty {
            self.showSimpleAlert(title: "Alert!", message: "Please enter a valid reading.")
            return false
        }
        
        if  let customer = RealmLayer.shared.getCustomer(by: self.serviceNumberTextField.text ?? "") {
            self.selectedCustomer = customer
        }else{
            self.showSimpleAlert(title: "Alert!", message: "Failed to find customer. Please enter a valid customer service number.")
            return false
        }
        
        let reading = Int(self.meterReadingTextField.text ?? "0") ?? 0
        
        if reading <= 0 {
            self.showSimpleAlert(title: "Alert!", message: "Meter reading must be greater than 0. Please enter a valid meter reading.")
            return false
        }
        
        if reading < (self.selectedCustomer?.meterReadings.last?.reading ?? 0) {
            self.showSimpleAlert(title: "Alert!", message: "Reading is less than previous reading. Please enter correct reading.")
            return false
        }
        
        
        self.enteredReading = reading
        
        return true
    }
    
    
    @IBAction func submitAction(_ sender: Any) {
        
        guard self.isValidData() else {
            return
        }
        
        
        self.performSegue(withIdentifier: "show_details_segue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let srVC = segue.destination as? SaveReadingsViewController {
            srVC.currentCustomer    = self.selectedCustomer
            srVC.enteredReading     = self.enteredReading
        }
    }

}

