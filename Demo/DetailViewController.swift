import UIKit

class DetailViewController: UIViewController {
    
    // Mark: -  IBOutlet
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    // Mark: - Variable
    var icon = ""
    var name = ""
    var address = ""

    override func viewDidLoad() {
        super.viewDidLoad()

    iconImage.layer.cornerRadius = iconImage.layer.frame.height / 2
        
        iconImage.sd_setImage(with: URL(string: icon), completed: nil)
        nameLabel.text = name
        addressLabel.text = address
        
    }
    



}
