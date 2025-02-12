import Foundation

@propertyWrapper
struct Decimal {
    var money: String
    
    var projectedValue = ""
    
    var wrappedValue: String {
        get {
            return Int(money)!.formatted(.number) + "원"
        }
        set {
            money = newValue
            projectedValue = "이체 금액: \(newValue)원"
        }
    }
}

struct Example {
    @Decimal(money: "7000")
    var num
}

var example = Example()

example.num
example.num = "534121231921923"
example.$num
example.num
