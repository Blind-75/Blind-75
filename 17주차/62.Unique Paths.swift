// 파스칼의 삼각형

// 런타임에러 코드
// 팩토리얼 func 때문에 시간복잡도가 올라감
class Solution {
    func factorial(_ num: Int) -> Int {
        if num == 0 || num == 1 {
            return 1
        }
        var result = 1
        for i in 2...num {
            result *= i
        }
        return result
    }
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        // 총 이동 수 (아래로 m-1번, 오른쪽으로 n-1번)
        let totalMoves = (m - 1) + (n - 1)
        // 아래로 가는 이동 수
        let downMoves = m - 1
        // 조합 C(totalMoves, downMoves) 계산
        let uniquePaths = factorial(totalMoves) / (factorial(downMoves) * factorial(totalMoves - downMoves))
        return uniquePaths
    }
}

// 런타임에러
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        // 총 이동 수 (아래로 m-1번, 오른쪽으로 n-1번)
        let totalMoves = (m - 1) + (n - 1)
        // 아래로 가는 이동 수
        let downMoves = m - 1
        // 조합 C(totalMoves, downMoves) 계산
        var result = 1
        for i in 0..<downMoves {
            result = result * (totalMoves - i) / (i + 1)
        }
        return result
    }
}

// 통과
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        // m+n-2 크기의 파스칼 삼각형을 생성
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        // 첫 번째 열과 첫 번째 행은 모두 1로 초기화
        for i in 0..<m {
            dp[i][0] = 1
        }
        for j in 0..<n {
            dp[0][j] = 1
        }
        // 나머지 셀을 채우기
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1] // 위쪽 셀과 왼쪽 셀의 합
            }
        }
        return dp[m - 1][n - 1] // 도착 셀의 값 반환
    }
}