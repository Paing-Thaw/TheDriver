//
//  MainMenuTableViewCell.swift
//  TheDriver
//
//  Created by Eureka Tatsu on 1/6/22.
//

import UIKit

class MainMenuTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var destinationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
