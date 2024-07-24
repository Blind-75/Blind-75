class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict_: [Int: Int] = [:]

        for num in nums {
            dict_[num, default: 0] += 1
        }

        let sortedTuples = dict_.sorted { $0.value > $1.value }
        let topK = Array(sortedTuples.prefix(k)).map { $0.key }

        return topK
    }
}

// 풀이 방법
// 1. nums의 요소를 하나씩 꺼내어 딕셔너리에 [요소 : 요소개수]로 저장
// 2. 딕셔너리의 밸류 값을 기준으로 오름차순 정렬
// 3. 상위 k개만큼 키 값을 배열로 담아 리턴