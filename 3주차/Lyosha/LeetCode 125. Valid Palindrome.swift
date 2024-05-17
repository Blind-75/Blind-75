class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var mystack: [Character] = []
        var newString: [Character] = []
        
        for c in s {
            if !c.isLetter && !c.isNumber {
                continue
            }
            newString.append(Array(c.lowercased())[0])
        }
        if newString.count % 2 == 1 {
            newString.remove(at:newString.count/2)
        }
        while newString.count > 0 {
            if newString[0] == newString.last{
                newString.remove(at:0)
                newString.remove(at:newString.count-1)
            }
            else{
                break
            }
            
        }
        if newString.count > 0{
            return false
        }
        return true
    }
}
