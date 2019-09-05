import Foundation
import SwiftyJSON

struct Venue {
    var name: String
    var location: String
    var catIcon: String
    
    init() {
        name = ""
        location = ""
        catIcon = ""
    }
    
    init(response: JSON){
        name = response["name"].stringValue
        location = response["location"]["formattedAddress"].arrayValue.map({ $0.stringValue }).joined(separator: ",")
        if  let categorie = response["categories"].arrayValue.first?.dictionaryValue,
            let prefix = categorie["icon"]?["prefix"].stringValue,
            let suffix = categorie["icon"]?["suffix"].stringValue {
            catIcon = prefix + "64" + suffix
        } else {
            catIcon = ""
        }
    }
    
    func description() {
        print("name: \(name)")
        print("location: \(location)")
        print("cat icon: \(catIcon)")
    }
}
