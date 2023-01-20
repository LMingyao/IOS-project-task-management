//
//  UserTableViewCell.swift
//  TaskManager
//
//  Created by Jacob C on 2022-12-02.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    static let identifier = "UserTableViewCell"
    
    @IBOutlet var UserTableViewCell: UIView!
    @IBOutlet var lblEmail: UILabel!
    @IBOutlet var imgStar: UIImageView!
    @IBOutlet var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setContent(user : UserModel ){
        lblName.text = user.name
        lblEmail.text =
        user.email
        
        if Session.loggedUser!.uid == user.uid {
            imgStar.isHidden = false
        }else {
            imgStar.isHidden = true
        }
       
     
       
        
      
        
        
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
