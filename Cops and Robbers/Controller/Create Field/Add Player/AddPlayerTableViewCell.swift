//
//  AddPlayersTableViewCell.swift
//  Cops and Robbers
//
//  Created by Shoko Hashimoto on 2020-01-12.
//  Copyright © 2020 Shoko Hashimoto. All rights reserved.
//

import UIKit

protocol AddPlayerTableViewCellDelegate {
    func pressedAdd(player: Friend)
}

class AddPlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var addedButton: UIButton!

    var cellValues: Friend!
    var addPlayerTableViewCellDelegate: AddPlayerTableViewCellDelegate?
    fileprivate var addPlayerViewModel = AddPlayerViewModel()
    
    func setCellValues(cellValues: Friend, bStatus: Bool){
        self.cellValues = cellValues
        userNameLabel.text = cellValues.userName
        userImageView.contentMode = .scaleToFill
        addedButton.isEnabled = bStatus
        if let userImageURL = cellValues.userImageURL {
            userImageView.loadImageUsingCacheWithUrlString(urlString: userImageURL)
        }
    }
    
    
    @IBAction func pressedAddButton(_ sender: Any) {
        addedButton.isEnabled = false
        addPlayerTableViewCellDelegate?.pressedAdd(player: self.cellValues)
    }
}
