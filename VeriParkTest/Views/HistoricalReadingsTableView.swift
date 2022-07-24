//
//  HistoricalReadingsTableView.swift
//  VeriParkTest
//
//  Created by Zulqarnain Mustafa on 24/07/2022.
//

import UIKit
import SwiftDate

class HistoricalReadingsTableView: UITableView,UITableViewDelegate,UITableViewDataSource {
    
    

    var tableArray = [MeterReading]()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HistoricalReadingsTableViewCell
        let reading = self.tableArray[indexPath.row]
        
        cell.readingDateLabel.text      = reading.readingDate?.toLocalTime().toFormat("dd MMMM, yyyy HH:mm:ss")
        cell.meterReadingLabel.text     = "Reading: \(reading.reading)"
        cell.calculatedCostLabel.text   = "Units: \(reading.unitsConsumption)  = Cost: $\(reading.calculatedCost)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.delegate = self
        self.dataSource = self
    }

}
