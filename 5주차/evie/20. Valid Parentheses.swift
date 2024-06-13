class Solution {
    func isValid(_ s: String) -> Bool {
        // 빈 배열로 초기화
        // String type : 여러 문자가 포함된 문자열
        // Character type : 하나의 문자
        var stack = [Character]()
        let parentheses: [Character: Character] = ["(":")", "[":"]", "{":"}"]

        for i in s {
            if parentheses.keys.contains(i) {
                stack.append(i)
            } else if let last = stack.popLast(), parentheses[last] == i {
                continue
            } else {
                return false
            }
        }
        return stack.isEmpty
    }
}

// removeLast()와 popLast()
// 두 메소드 모두 배열이 비어있지 않으면 마지막 요소를 제거 후 반환

// removeLast()
// 반환 값은 지정한 타입
// 배열이 비어있을 경우 호출하면 런타임 에러가 발생

// popLast()
// 반환 값이 옵셔널 타입으로 if let 바인딩 등으로 언래핑하여 사용
// 배열이 비어있을 때 nil 값을 반환
// popLast를 사용하는 것이 더 안전함