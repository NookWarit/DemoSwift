import UIKit

class DisplayCell: UITableViewCell {
    //Mark: - IBOutlet
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = img.layer.frame.height / 2
    }

    
    
}
