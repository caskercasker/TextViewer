//
//  FileListTableViewCell.swift
//  TextViewer
//
//  Created by 조우현 on 2022/09/27.
//

import UIKit

class FileListTableViewCell: UITableViewCell {

    @IBOutlet weak var listLabel: UILabel!
    @IBOutlet weak var listButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
