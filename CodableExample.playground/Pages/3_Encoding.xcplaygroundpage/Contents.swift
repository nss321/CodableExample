import Foundation

// struct -> Data
                
struct User: Encodable {
    let name: String
    let age: Int
    let birth: Date
}

let Sean = [
    User(name: "션", age: 12, birth: Date.now),
    User(name: "렛쯔", age: 13, birth: Date(timeIntervalSince1970: 86400 * 10000)),
    User(name: "마나", age: 14, birth: Date.now.addingTimeInterval(-86400 * 10000)),
]

let format = DateFormatter()
format.dateFormat = "yyyy년 MM월 dd일 E hh시 mm분 ss초"

let encoder = JSONEncoder()
encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
//encoder.dateEncodingStrategy = .custom({ <#Date#>, <#any Encoder#> in
//    <#code#>
//})
encoder.dateEncodingStrategy = .iso8601
//encoder.dateEncodingStrategy
//encoder.outputFormatting
//encoder.keyEncodingStrategy
//encoder.dataEncodingStrategy

//Router Pattern
//["page": 1, "language": "ko-KR"]

do {
    let result = try encoder.encode(Sean)
    print(result)

    guard let jsonString = String(data: result, encoding: .utf8) else {
        fatalError("ERROR")
    }
    
    print(jsonString)
    
} catch {
    print(error)
}

