//
//  ChatCell.swift
//  ParseChatApp
//
//  Created by Justin Lee on 2/22/18.
//  Copyright © 2018 Personal Projects. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

  
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
