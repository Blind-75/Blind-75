class Solution {
    func numDecodings(_ s: String) -> Int {
        let message = Array(s).compactMap{Int(String($0))}
        let count = message.count 

        guard count > 0, message[0] != 0 else { return 0 }
        guard count > 1 else { return 1 }

        var prev1 = 1
        var prev2 = 1
        var cur = 0 

        for i in 1..<count {
            cur = 0 
            var number = message[i]
            if number != 0 {
                cur += prev1 
            }
            var doubleNumber = number + message[i - 1] * 10
            if doubleNumber >= 10, doubleNumber <= 26 {
                cur += prev2 
            }
            prev2 = prev1
            prev1 = cur
        }
        return cur
    }
}