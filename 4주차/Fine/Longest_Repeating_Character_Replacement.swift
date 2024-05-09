class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        
    var maxLength = 0 // k 번 바꾸었을 때 가능한 최대 길이
    var maxCount = 0 // 가장 많이 출현한 char의 개수
    var start = 0 // window 시작 지점
    var charCount = [Character : Int]() // 각 char 출현횟수

    let chars = String(s) // s를 character 배열로 변환

    // end 위치를 이동시키면서 윈도우 사이즈 조정
    for end in 0 ..< chars.count{

        let char = chars[end] // window에서의 end지점의 char
        charCount[char, default:0] += 1 // end를 기준으로 전체 문자열에서의 문자 등장 횟수 세기 
        maxCount = max(maxCount, charCount[char]!) // 문자열 등장횟수 업데이트 후 해당 문자열에서 가장 많이 나온 문자 횟수 체크하기

       
        while (end - start + 1) - maxCount > k {
             charCount[chars[start]]! -= 1
                start += 1
                
                if (end - start + 1) - maxCount > k { 
                    maxCount = charCount.values.max() ?? 0
                }
        }

         maxLength = max(maxLen, end - start + 1)
    }

        return maxLength
    }
}