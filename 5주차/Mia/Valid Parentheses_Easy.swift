class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        var myString = Array(s)
        var pairA: [Character: Character] = ["(": ")", "{" : "}", "[": "]"]
        var pairB: [Character: Character] = [")": "(", "}" : "{", "]": "["]

        for i in myString{
            if let value = pairA[i]{
                stack.append(i)
            }else{
                if let key = pairB[i]{
                    guard let lastElement = stack.last else { 
                        stack.append(i)
                        break
                    }
                        if lastElement == key{
                            stack.removeLast()
                        }else{
                            break
                        }
                }
            }
        }

        if stack.isEmpty{
            return true
        }else{
            return false
        }
    }
}