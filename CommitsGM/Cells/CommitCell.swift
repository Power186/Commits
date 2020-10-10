//
//  CommitCell.swift
//  CommitsGM
//
//  Created by Scott on 10/8/20.
//

import UIKit

final class CommitCell: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var hashLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
