// 피보나치 수열 점화식
// 1 -> 1
// 2 -> 2
// 3 -> 3
// 4 -> 5

class Solution {
    /**
     * @param {number} n
     * @return {number}
     */
    climbStairs(n) {
        if (n <= 2) return n;

        let prev1 = 1, prev2 = 2;
        
        for (let i = 3; i <= n; i++) {
            let curr = prev1 + prev2;
            prev1 = prev2;
            prev2 = curr;
        }

        return prev2;
    }
}

//Swift
/*
class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 {
            return n
        }
        
        var prev1 = 1
        var prev2 = 2
        
        for _ in 3...n {
            let curr = prev1 + prev2
            prev1 = prev2
            prev2 = curr
        }
        
        return prev2
    }
}
*/