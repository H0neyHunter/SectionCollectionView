//
//  TableViewCell.swift
//  SectionCollectionView
//
//  Created by Ümit Örs on 21.12.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelT: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
