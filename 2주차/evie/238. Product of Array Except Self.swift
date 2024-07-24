// 실패한 코드
// 이중for문을 사용해서 인덱스값을 체크, 자기 자신을 제외한 값을 곱하기
// 배열에 [0]이 있을 때 문제 생김

// class Solution {
//     func productExceptSelf(_ nums: [Int]) -> [Int] {
//         var answer: [Int] = []
//         for i in nums {
//             var idxCheck = i
//             var multi = 1
//             for j in nums {
//                 if j != idxCheck {
//                     multi *= j
//                 }
//             }
//             answer.append(multi)
//         }
//     return answer
//     }
// }


// 0에 대한 처리를 먼저하기 -> 0의 존재 유무
// 0의 개수 처리하기 -> 0이 한 개이면 0 자리를 제외한 모든 값이 0이고 0이 두 개 이상이면 모두 0
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var answer: [Int] = []
        var zeroCount = 0
        var productOfNonZeros = 1
        
        // 0이 몇 개 있는지 세고, 0이 아닌 수들의 곱을 구함
        for num in nums {
            if num == 0 {
                zeroCount += 1
            } else {
                productOfNonZeros *= num
            }
        }
        
        // 0이 둘 이상 있는 경우 결과 배열은 모두 0이 됨
        if zeroCount >= 2 {
            return Array(repeating: 0, count: nums.count)
        }
        
        // 결과 배열을 계산
        for num in nums {
            if num == 0 {
                answer.append(productOfNonZeros)
            } else if zeroCount == 1 {
                answer.append(0)
            } else {
                answer.append(productOfNonZeros / num)
            }
        }
        
        return answer
    }
}
