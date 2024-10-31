class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var numArray: [Int] = []

        for num in nums {
            if numArray.isEmpty || num > numArray.last! { 
                numArray.append(num)
            } else {
                // 새로운 숫자가 numArray의 마지막 숫자보다 작거나 같으면
                var left = 0, right = numArray.count - 1 // 왼쪽과 오른쪽 끝 위치를 설정해요
                
                // 이진 탐색을 통해 num이 들어갈 위치를 찾아요
                while left < right { 
                    let mid = left + (right - left) / 2 // 중간 위치를 계산해요
                    if numArray[mid] < num { 
                        // 만약 중간 숫자가 num보다 작으면
                        left = mid + 1 // num은 그보다 오른쪽에 있어야 해요, 그래서 left를 옮겨요
                    } else {
                        right = mid // 중간 숫자가 num보다 크거나 같으면, right를 mid로 옮겨요
                    }
                }
                numArray[left] = num // num이 들어갈 위치(left)에 값을 넣어 기존 숫자를 바꿔요
            }
        }
        return numArray.count // numArray 배열의 길이가 최종 결과, 즉 증가하는 수열의 길이를 의미해요
    }
}