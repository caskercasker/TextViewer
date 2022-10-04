//
//  TxtTableViewCell.swift
//  TextViewer
//
//  Created by 조우현 on 2022/10/04.
//

import UIKit

class TxtTableViewCell: UITableViewCell {

    @IBOutlet weak var SecondView: UILabel?
    @IBOutlet weak var loadingTxtFile: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
//        SecondView?.isUserInteractionEnabled = true
//        SecondView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:))))
        // Initialization code
    }

//    @objc func labelTapped (_ sender: UITapGestureRecognizer){
//        //print(list.indexPath.row)
//        print("label tapped")
//    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
