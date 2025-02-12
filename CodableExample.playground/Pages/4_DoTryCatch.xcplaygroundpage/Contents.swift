import Foundation

/*
 오류 처리 패턴, 에러 핸들링
 if - else, switch - case
 do try -

 닉네임:
 
 */

func checkDateFormat(text: String) -> Bool {
    let format = DateFormatter()
    format.dateFormat = "yyyyMMdd"
    if let text = format.date(from: text) {
        return true
    } else {
        return false
    }
}

func validateUserInput(text: String) -> Bool {
    guard !(text.isEmpty) else {
        print("빈값")
        return false
    }
    
    guard Int(text) != nil else {
        print("숫자가 나이")
        return false
    }
    guard checkDateFormat(text: text) else {
        print("날짜가 잘못됨")
        return false
    }
    
    return true
}

//if validateUserInput(text: "saf") {
//    print("가넝")
//} else {
//    print("쌉불가")
//}

// 오류 처리 패턴
// 명시적 오류
// 컴파일러가 오류의 타입을 인정하게 됨
enum ValidationError: Error {
    case emptyString
    case isNotInt
    case isNotDate
}

// throwind function: throws 키워드로 표시된 함수
// 에러를 발생시킬 수 있다는 전제하에 키워드를 함수 선언부의 파라미터 뒤에 붙임
// throws(Type) 은 Swift6 문법임
func validateUserInputError(text: String) throws(ValidationError) -> Bool {
    guard !(text.isEmpty) else {
        print("빈값")
        throw .emptyString
    }
    
    guard Int(text) != nil else {
        print("숫자가 나이")
        throw .isNotInt
    }
    
    guard checkDateFormat(text: text) else {
        print("날짜가 잘못됨")
        throw .isNotDate
    }
    
    return true
}

//let test = validateUserInput(text: <#T##String#>)

// 대응을 할 수 없는 코드임.
// try?를 던지면 nil로 반환함. 어떤 오류가 발생했는지 모름.
//let result = try validateUserInputError(text: "")

// case 별로 error 처리
//do {
//    try validateUserInputError(text: "21321")
//} catch ValidationError.emptyString {
//    print("공백이 아닌게 아리마셍")
//} catch ValidationError.isNotInt {
//    print("숫자가 아리마셍")
//} catch ValidationError.isNotDate {
//    print("날짜가 아리마셍")
//}

do {
    try validateUserInputError(text: "")
} catch {
    // Error 타입을 구체적으로 정의할 수 없어서 타입캐스팅을 활용해서 처리
    // try-catch 문에서는 무조건 Error Protocol만 잡아 줌. 커스텀을 했다면? 타입 캐스팅 해줘야함.
    // 여기까지가? swift5 까지의 내용 ㅋㅋ
//    switch error as? ValidationError {
//    case .emptyString:
//        print("빈 값 입니 당다리당당")
//    default:
//        print("나머지 오류 처리")
//    }
    
    // Swift6 -> Typed Throws
    switch error {
    case .emptyString:
        print("빈 값 입니 당다리당당")
    default:
        print("나머지 오류 처리")
    }
    
    
}


