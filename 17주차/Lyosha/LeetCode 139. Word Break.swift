class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var memo: [Int: Bool] = [:]
        var arr = Array(s)
        let n = arr.count

        func dp(i: Int) -> Bool { 
            if i == arr.count { 
                return true
            }

            if memo[i] != nil { 
                return memo[i]!
            }

            var isFound: Bool = false
            for word in wordDict { 
                if String(arr[i..<n]).starts(with: word) { 
                    if dp(i: i+word.count) { 
                        isFound = true
                    }
                }
            }
            memo[i] = isFound
            return isFound
        }

        return dp(i: 0)
    }
}