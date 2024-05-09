class Solution {
        
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLength = 0
        var start = 0
        var charIndexMap = [Character: Int]() // 문자의 마지막 위치를 저장하는 사전

        for (i, char) in s.enumerated() {
            if let index = charIndexMap[char] {
                start = max(start, index + 1) // 중복 문자 다음 위치로 `start`를 업데이트
            }
            charIndexMap[char] = i // 현재 문자의 위치를 저장
            maxLength = max(maxLength, i - start + 1) // 최대 길이를 갱신
        }

        return maxLength
    }
}
