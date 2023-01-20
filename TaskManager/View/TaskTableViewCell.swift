//
//  TaskTableViewCell.swift
//  TaskManager
//
//  Created by Jacob C on 2022-11-30.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    static let identifier = "TaskTableViewCell"
    
    @IBOutlet var lblTask: UILabel!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var imageBtn: UIImageView!
    
    public func setContent(TaskModel : TaskModel ){
        lblTask.text = TaskModel.description
        lblName.text =
        TaskModel.createdByName
        
        imageBtn.image = imageBtn.image?.withRenderingMode(.alwaysTemplate)
       
     
       
        
      
        
        
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
