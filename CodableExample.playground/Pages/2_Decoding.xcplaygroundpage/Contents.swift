import Foundation

// 서버에서 이상한 값이 온다면?

let json = """
{
    "product": "도봉캠퍼스 캠핑카",
    "price": 12345000,
    "mall": "네이버"
}
"""

/*
 디코딩 방식 - Decoding Strategy
 
 1. json과 동일한 키를 사용하기
 2. 런타임 이슈를 방지하기 위한 옵셔널, 데이터를 유실할 수 있음
 3. CodingKey
 4. 디코딩 전략 -> snake case를 camel case로
 */

struct Product: Decodable {
    let item: String
    let price: Int
    let mall: String
    let influencer: Bool

    enum CodingKeys: String, CodingKey {
        case item = "product_name"
        case price
        case mall = "mall_name"
    }
    
    // 커스텀 디코딩
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decode(String.self, forKey: .item)
        price = (try container.decodeIfPresent(Int.self, forKey: .price)) ?? 0
        mall = try container.decode(String.self, forKey: .mall)
        influencer = (10000000..<20000000).contains(price) ? true : false
    }
}

guard let result = json.data(using: .utf8) else {
    fatalError("변환 실패")
}

let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase


do {
    let value = try decoder.decode(Product.self, from: result)
    dump(value)
} catch {
    print(error)
}
