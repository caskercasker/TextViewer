//
//  TableViewCell.swift
//  TextViewer
//
//  Created by 조우현 on 2022/09/27.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var uiLabel: UILabel!
    @IBOutlet weak var uiButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}