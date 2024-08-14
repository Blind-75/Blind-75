class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var combination = [Int]()

        let candidates = candidates.sorted() 
        backtrack(0, target)
        return result

        func backtrack(_ start: Int, _ target: Int){
            if target == 0{
                result.append(combination)
                return
            }

            for i in start..<candidates.count{
                if candidates[i] > target{
                    break 
                }
                combination.append(candidates[i])
                backtrack(i, target - candidates[i])
                combination.removeLast()
            }
        }
    }
}