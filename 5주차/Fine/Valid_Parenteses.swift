class Solution {
    func isValid(_ s: String) -> Bool {
    
    // 닫는 괄호가 key, 여는 괄호가 value로 mapping 
    // 닫는 괄호를 넣었을 때 대응하는 여는 괄호가 나오도록 
    let braketMap : [Character : Character] = [ ")" : "(", "}" : "{", "]" : "["]
    var stack: [Character] = []

    // 여는 괄호의 경우에만 stack에 추가 // 닫는 괄호는 stack에서 대응하는 여는 괄호가 있는지 확인 
    for char in s {
        // 닫는 괄호의 경우에는 대응하는 key 존재 
        if let matchingBraket = braketMap[char]{
            let topElement = stack.popLast() ?? "*" 

            if matchingBraket != topElement {
                return false 
            }

        } else {
             // 여는 괄호의 경우에는 대응하는 key가 없음
            stack.append(char)
        }

        return stack.isEmpty 
       
    }



    }
}