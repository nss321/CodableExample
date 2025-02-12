//: [Previous](@previous)

import Foundation

let list = ["7", "fg", "asd"]

// 서브스크립트. subscript 문법
list[2] // "asd"

let nick = "안녕하세요. 반갑습니다."

//nick[4] 문자열은 섭스크립트 문법 지원 X

extension String {
    subscript(idx: Int) -> String? {
        guard (0..<count).contains(idx) else {
            return nil
        }
        let result = index(startIndex, offsetBy: idx)
        return String(self[result])
    }
}

nick.forEach { char in
    print(char, separator: "")
}

struct UserPhoneList {
    var contacts = [
        "01002021021",
        "01009419212",
        "01091200000",
    ]
    
    subscript(idx: Int) -> String {
        get {
            return self.contacts[idx]
        }
        set {
            self.contacts[idx] = newValue
        }
    }
}

var phone = UserPhoneList()
phone[0]
phone[0] = "39129"
phone[0]
