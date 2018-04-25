//
//  PeripheralTableViewCell.swift
//  For RC Car Controller
//  Created by Peter Gifford on 5/10/18.
//
//// Based on tutorials be Trevor Beaton
import UIKit

class PeripheralTableViewCell: UITableViewCell {

    @IBOutlet weak var peripheralLabel: UILabel!
    @IBOutlet weak var rssiLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
