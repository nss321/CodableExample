import Foundation

struct SeanDefaults<T> {
 
    let key: String
    let empty: T
    
    var myValue: T {
        get {
            UserDefaults.standard.object(forKey: key) as? T ?? empty
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: key)
            
        }
    }
}

let age = SeanDefaults(key: "age", empty: 16)
let first = SeanDefaults(key: "first", empty: false)
let nick = SeanDefaults(key: "nick", empty: "션션")

age.myValue
first.myValue
nick.myValue

enum UserDefaultsManager {
    enum Key: String {
        case email, nickname, phone
    }
    
    static var age = SeanDefaults(key: Key.email.rawValue, empty: 17)
    static var first = SeanDefaults(key: Key.nickname.rawValue, empty: false)
    static var nick = SeanDefaults(key: Key.phone.rawValue , empty: "션션")
}

// Usage in vc
// enum, struct 구조에서 항상 myValue를 호출해야하는게 좀 아니꼬움;;
UserDefaultsManager.age.myValue
UserDefaultsManager.age.myValue
UserDefaultsManager.age.myValue
