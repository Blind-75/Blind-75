class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var stringArray = Array(s.lowercased())
        var p1 = 0
        var p2 = s.count - 1
        while p1 < p2{
            if !(stringArray[p1].isNumber || stringArray[p1].isLetter){
                p1 += 1
                continue
            }
            if !(stringArray[p2].isNumber || stringArray[p2].isLetter){
                p2 -= 1
                continue
            }
            if stringArray[p1] == stringArray[p2]{
                p1 += 1
                p2 -= 1
            }else{
                return false
            }
        }
        return true
    }
}