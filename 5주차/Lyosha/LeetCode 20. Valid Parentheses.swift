class Solution {
    func isValid(_ s: String) -> Bool {
        var mystack: [Character] = []
        for (i, c) in s.enumerated(){
            if (c == ")" && mystack.count != 0 && mystack.last == "("){
                mystack.removeLast()
            }
            else if (c == "}" && mystack.count != 0 && mystack.last == "{"){
                mystack.removeLast()
            }
            else if (c == "]" && mystack.count != 0 && mystack.last == "["){
                mystack.removeLast()
            }

            else {
                mystack.append(c)
            }
        }

        if mystack.count == 0{
            return true
        }
        return false
    }
}