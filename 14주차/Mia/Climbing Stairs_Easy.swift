class Solution {
    func climbStairs(_ n: Int) -> Int {
        var record = [0, 1, 2]

        if n > 2 {
            for i in 3...n {
                record.append(record[i-1] + record[i-2])
            }
        }
        return record[n]
    }
}