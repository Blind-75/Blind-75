//https://leetcode.com/problems/top-k-frequent-elements/

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // 요소와, 각 요소가 얼마나 반복되는지 나타내는 딕셔너리를 생성
        var countMap = [Int: Int]()

        //요소가 카운트 될 때마다 딕셔너리 값에 1 추가
        for num in nums {
            countMap[num, default: 0] += 1
        }

        // 중복되지 않는 값을 가진 요소들 (키값) 만 가진 배열을 만들기
        let uniqueNums = Array(countMap.keys)

        // 중복되지 않는 값을, 카운트 숫자로 정렬하기
        // 여기 이해 잘 안됨 sorted 에 갑자기 왜 countMap 으로 기준을 주지?
        let sortedUniqueNums = uniqueNums.sorted {
            countMap[$0]! > countMap[$1]!
        }

        // 빈도수 높은 밸류로 k 만큼 잘라서 리턴하기
        return Array(sortedUniqueNums.prefix(k))
    }
}
