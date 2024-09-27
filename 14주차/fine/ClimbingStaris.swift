class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n <= 0 {
            return 0
        }

        if n == 1 {
            return 1
        }

        if == 2 {
            return 2
        }

        var first = 1
        var second = 2 

        for i in  3...n{
            let thrid = first + second
            first = second 
            second = third 
        } 
        
        return second 
    }
}