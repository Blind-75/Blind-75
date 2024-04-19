class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [Int]()
        for i in 0..<nums.count{
            var pair = target - nums[i]
            if var j = nums.firstIndex(of: pair){
                if i != j{
                    result.append(i)
                    result.append(j)
                    return result
                }
            }
        }
        return [0,0]
    }
}