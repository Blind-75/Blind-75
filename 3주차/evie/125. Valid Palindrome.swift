import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
          let filteredString = s.replacingOccurrences(of: #"[^a-zA-Z0-9]"#, with: "", options: .regularExpression).lowercased()
        return filteredString == String(filteredString.reversed())
    }
}