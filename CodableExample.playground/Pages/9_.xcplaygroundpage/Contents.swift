import Foundation

/*
 @propertyWrapper을 쓰려면?
 - wrappedValue가 꼭 있어야함(필수).
 - projectedValue (optional)
 - defaultValue // 그냥 empty를 다르게 선언한 것. 필수 X
 */

@propertyWrapper struct SeanDefaults<T> {
 
    let key: String
    let empty: T
    
    private(set) var projectedValue: Bool = false
    
    var wrappedValue: T { // 무조건 호출
        get {
            UserDefaults.standard.object(forKey: key) as? T ?? empty
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: key)
        }
    }
}

enum UserDefaultsManager {
    enum Key: String {
        case email, nickname, phone
    }
    
    @SeanDefaults(key: Key.email.rawValue, empty: 17) static var email
    @SeanDefaults(key: Key.nickname.rawValue, empty: false) static var nickname
    @SeanDefaults(key: Key.phone.rawValue, empty: "스껄?") static var phone
    
//    static var age = SeanDefaults(key: Key.email.rawValue, empty: 17)
//    static var first = SeanDefaults(key: Key.nickname.rawValue, empty: false)
//    static var nick = SeanDefaults(key: Key.phone.rawValue , empty: "션션")
}

// Usage in vc
// enum, struct 구조에서 항상 myValue를 호출해야하는게 좀 아니꼬움;;
UserDefaultsManager.email
UserDefaultsManager.email = 1220
UserDefaultsManager.email


// ---- 여기부터는 UIKit에서 많이 쓰지는 않음. ----
UserDefaultsManager.nick // wrappedValue
UserDefaultsManager.$nick // projectedValue: 래퍼의 부가적인 상태를 외부에 보여주려고 할 때.
