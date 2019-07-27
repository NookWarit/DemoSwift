import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    //Mark: - IBOutlet
    @IBOutlet weak var tableView : UITableView!
    
    //Mark: -Variable
    let displayCell = "DisplayCell"
    
    
    //Mark: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "DisplayCell", bundle: nil), forCellReuseIdentifier: displayCell)
        
        Alamofire.request("https://api.foursquare.com/v2/venues/explore?near=NYC&oauth_token=D1LRRCXBCXHHWWLQ4O41QA0NJSMSMYOR5IJLMT4IUV3HCKDZ&v=20180815",
                          
                          method: .get)
            .responseJSON(completionHandler: {response in
                let res = JSON(response.value ?? [:])
                let group = res["response"]["groups"].arrayValue.first?.dictionaryValue
                let items = group?["items"]?.arrayValue



//                let res = response.value as? Dictionary<String,Any>
//                let ress = res?["response"] as? Dictionary<String,Any>
//                let group = ress?["groups"] as? Array<Any>
//                let groupDic = group?.first as? Dictionary<String,Any>
//                let items = groupDic?["items"] as? Array<Any>
                
                print(items ?? []  )})
    }


}
//Mark: - UITableViewDatasorce & Delegate
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: displayCell, for: indexPath) as! DisplayCell
        
        return cell
    }
    
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



