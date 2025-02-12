import Foundation

struct SeanDefaults {
 
    let key: String
    let empty: String
    
    var myValue: String {
        get {
            UserDefaults.standard.string(forKey: key) ?? empty
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: key)
            
        }
    }
}


var nickname = SeanDefaults(key: "nick", empty: "손님")
var phone = SeanDefaults(key: "phone", empty: "00")

nickname.myValue = "션발롬"
nickname.myValue

phone.myValue = "010 1010 0101"
phone.myValue

