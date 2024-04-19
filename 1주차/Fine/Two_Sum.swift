class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var numToIndex = [Int : Int]() // 숫자 : 인덱스 

        for (index, num) in nums.enumerated(){
            let remaining = target - num 
            if let remainingIndex = numToIndex[remaining]{
                return [remainingIndex, index]
            }
            numToIndex[num] = index
        }
        return []
    }
}