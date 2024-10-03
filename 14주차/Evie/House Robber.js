// DP Bottom-Up
// 작은 값들을 누적시키면서 진행

class Solution {
    /**
     * @param {number[]} nums
     * @return {number}
     */
    rob(nums) {
        if (nums.length === 0) return 0;
        if (nums.length === 1) return nums[0];

        let prev1 = 0, prev2 = 0;

        for (let num of nums) {
            let temp = prev1;
            prev1 = Math.max(prev1, prev2 + num);
            prev2 = temp;
        }

        return prev1;
    }
}

/*
Swift

class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        if nums.count == 1 { return nums[0] }

        var prev1 = 0
        var prev2 = 0

        for num in nums {
            let temp = prev1
            prev1 = max(prev1, prev2 + num)
            prev2 = temp
        }

        return prev1
    }
}
*/