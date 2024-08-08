class Solution {
    var mystack: [Int] = []
    var answer: [[Int]] = []

    init() {
            self.mystack = []
            self.answer = []
        }

    func copyStack() -> [Int] { 
        var newArr: [Int] = []
        for num in self.mystack{
            newArr.append(num)
        }
        return newArr
    }

    func dfs(_ maxSize: Int, _ index: Int, _ depth: Int, _ currSum: Int, _ target: Int, _ candidates: [Int]) { 
        if depth == maxSize { 
            if currSum == target { 
                self.answer.append(self.copyStack())
            }
        } else { 
            for i in index..<candidates.count { 
                if currSum+candidates[i] <= target { 
                    self.mystack.append(candidates[i])
                    self.dfs(maxSize, i, depth+1, currSum+candidates[i], target, candidates)
                    self.mystack.removeLast()
                }
            }
        }
    }

    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {


        for i in 0..<(target/candidates.min()!+1) { 
            self.mystack = []
            self.dfs(i, 0, 0, 0, target, candidates)
        }
     return self.answer
    }
}