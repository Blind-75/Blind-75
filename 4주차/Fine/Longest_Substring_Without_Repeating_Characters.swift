class Solution {
        
    func lengthOfLongestSubstring(_ s: String) -> Int {

        guard s.count > 0 else {
            return 0
        }

        var maxLength = 0
        var start = 0
        var charIndexMap = [Character: Int]() // 문자의 마지막 위치를 저장

        for (i, char) in s.enumerated() {

            // 해당 char가 딕셔너리에 존재한다는 건 현재 시퀀스가 새로 시작되어야 한다는 의미 
            if let index = charIndexMap[char] {
                // 중복 문자의 다음 위치로 이동 (단, 중복 문자의 다음 위치가 현재 Start 보다 뒤인 경우 이미 고려된 시퀀스임으로제외)
                start = max(start, index + 1) 
            }
            // char가 아직 딕셔너리에 없다는 건 현재 시퀀스가 계속 진행된다는 의미 
            charIndexMap[char] = i // 현재 문자의 위치를 저장
            // maxLength와 현재 시퀀스 길이 중 큰것을 maxLength로 저장 
            maxLength = max(maxLength, i - start + 1) // 최대 길이를 갱신
        }

        return maxLength
    }
}
