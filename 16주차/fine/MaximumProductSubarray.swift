class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        
        // 전체 최대값은 첫 번째 숫자로 초기화
        var result = nums[0]
        // 현재까지의 최대값과 최소값
        var currentMax = nums[0]
        var currentMin = nums[0]
        
        // 두 번째 숫자부터 순회
        for i in 1..<nums.count {
            let num = nums[i]
            
            // 현재 숫자와 이전까지의 최대/최소값을 곱한 결과 중 최대/최소 선택
            let temp = currentMax  // currentMax가 바뀌기 전에 저장
            currentMax = max(num, max(currentMax * num, currentMin * num))
            currentMin = min(num, min(temp * num, currentMin * num))
            
            // 전체 최대값 갱신
            result = max(result, currentMax)
        }
        
        return result
    }
}