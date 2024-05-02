class Solution {
    func isPalindrome(_ s: String) -> Bool {

        var letters = s.filter({$0.isLetter || $0.isNumber}).lowercased()

        return letters == String(letters.reversed())
    }
}