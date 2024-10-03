// 펠린드롬 문자열

// n개의 문자열에서 첫번째 문자열부터 마지막 문자열까지 펠린드롬인지 확인
// n-1번째 문자열까지 확인한 후 펠린드롬인 구간의 수만 리턴
// 펠린드롬 확인 방법 첫번째 문자열과 마지막 문자열이 같은지 먼저 확인한 후, 같으면 가운데 문자열이 동일한지 확인

func countSubstrings(_ s: String) -> Int {
    let stringArray = Array(s)
    let stringCnt = stringArray.count
    var cnt = 0

    func isPalindrome(_ start: Int, _ end: Int) -> Bool {
        var startP = start
        var endP = end
        while startP <= endP {
            if stringArray[startP] != stringArray[endP] {
                return false
            }
            startP += 1
            endP -= 1
        }
        return true
    }

    for i in 0..< stringCnt {
        for j in i..< stringCnt {
            if isPalindrome(i, j) {
                cnt += 1
            }
        }
    }

    return cnt
}
