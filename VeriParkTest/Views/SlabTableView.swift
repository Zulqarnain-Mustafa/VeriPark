//
//  SlabTableView.swift
//  VeriParkTest
//
//  Created by Zulqarnain Mustafa on 24/07/2022.
//

import UIKit

class SlabTableView: UITableView,UITableViewDelegate,UITableViewDataSource {

    var tableArray = [Slab]()
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SlabTableViewCell
        let slab = self.tableArray[indexPath.row]
        
        cell.calculationLabel.text = "\(slab.units ?? 0) units x \(slab.slabRate ?? 0) = $\(slab.cost ?? 0)"
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
