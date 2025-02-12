import Foundation

enum UserDefaultsManager {
    
    // 한곳에서만 사용하는 enum이라면 객체 내부에 nested하게 관리
    enum Key: String {
        case email
        case nickname
        case phone
    }

    static var email: String {
        get {
            UserDefaults.standard.string(forKey: Key.email.rawValue) ?? "이메일 없음"
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: Key.email.rawValue)
        }
    }
    
    static var nickname: String {
        get {
            UserDefaults.standard.string(forKey: Key.nickname.rawValue) ?? "닉네임 없음"
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: Key.nickname.rawValue)
        }
    }
}

UserDefaultsManager.email
UserDefaultsManager.email = "7@a.comAAAA@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
UserDefaultsManager.email
