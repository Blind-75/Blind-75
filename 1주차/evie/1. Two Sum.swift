// 오답코드
// 중복요소의 인덱스 값 처리 못함

class Solution {
    func combination(_ nums: [Int], _ targetNum: Int) -> [[Int]] {
        var result = [[Int]]()

        func combination(_ index: Int, _ nowCombi: [Int]) {
            if nowCombi.count == targetNum {
                result.append(nowCombi)
                return
            }
            for i in index..<nums.count {
                combination(i + 1, nowCombi + [nums[i]])
            }
        }

        combination(0, [])

        return result
    }

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var answer: [Int] = []
        let combi_num = combination(nums, 2)
        var num1: Int = 0
        var num2: Int = 0

        for com in combi_num {
            if com[0] + com[1] == target {
                num1 = com[0]
                num2 = com[1]
            }
        }
        num1 = nums.firstIndex(of: num1)!
        num2 = nums.firstIndex(of: num2)!

        return [num1, num2]
    }
}