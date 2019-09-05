import UIKit
import SDWebImage

class DisplayCell: UITableViewCell {
    // Mark: - IBOutlet
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    // Mark: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = img.layer.frame.height / 2
    }
    
    // Mark: - Function
    func configureCell(icon: String, name: String, address: String) {
        img.sd_setImage(with: URL(string: icon), completed: nil)
        titleLabel.text = name
        detailLabel.text = address
    }
    
    
}
