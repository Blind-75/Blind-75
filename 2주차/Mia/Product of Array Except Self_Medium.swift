class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var prefixArray = [Int](repeating: 1, count: nums.count)
        var suffixArray = [Int](repeating: 1, count: nums.count)
        var result = [Int](repeating: 0, count: nums.count)

        for i in 1..<nums.count{
            prefixArray[i] = nums[i - 1] * prefixArray[i - 1]
        }
        for j in (0..<(nums.count - 1)).reversed(){
            suffixArray[j] = nums[j + 1] * suffixArray[j + 1]
        }
        for k in 0..<nums.count{
            result[k] = prefixArray[k] * suffixArray[k]
        }
        return result
    }
}