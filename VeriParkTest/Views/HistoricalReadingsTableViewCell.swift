//
//  HistoricalReadingsTableViewCell.swift
//  VeriParkTest
//
//  Created by Zulqarnain Mustafa on 24/07/2022.
//

import UIKit


class HistoricalReadingsTableViewCell: UITableViewCell {

    @IBOutlet weak var readingDateLabel:    UILabel!
    @IBOutlet weak var meterReadingLabel:   UILabel!
    @IBOutlet weak var calculatedCostLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
