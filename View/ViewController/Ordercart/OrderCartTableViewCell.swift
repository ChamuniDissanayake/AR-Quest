//
//  OrderCartTableViewCell.swift
//  AR-Quest
//
//  Created by Madushan Senavirathna on 7/3/22.
//

import UIKit

class OrderCartTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewTable: UIImageView!
    @IBOutlet weak var deviceName: UILabel!
    @IBOutlet weak var priceRange: UILabel!
    @IBOutlet weak var deviceDescription: UILabel!
    @IBOutlet weak var unitCount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static let identifier = String(describing: OrderCartTableViewCell.self)
    
    func setup(_ tableSlide: TableViewData) {
        imageViewTable.image = tableSlide.image
        deviceName.text = tableSlide.deviceName
        priceRange.text = tableSlide.price
        deviceDescription.text = tableSlide.description
        unitCount.text = tableSlide.units
    }
}
