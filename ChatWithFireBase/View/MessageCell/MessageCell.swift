//
//  MessageCell.swift
//  ChatWithFireBase
//
//  Created by Admin on 18.08.23.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messegeBubleView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        messegeBubleView.layer.cornerRadius = messegeBubleView.frame.size.height / 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
