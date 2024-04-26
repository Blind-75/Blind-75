class Solution {
    
    // 내풀이
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int]{
        
        var numCount = [Int : Int]()

        for num in nums {
            numCount[num , default: 0] += 1
        }

        let sortedByFrequency = numCount.sorted { $0.value > $1.value }.map{ $0.key } 
        
        return Array(sortedByFrequency.prefix(k))
    }


    // gpt 개선
    func topKFrequentG(_ nums: [Int], _ k: Int) -> [Int]{

        var numCount = [Int:Int]()
        
        for num in nums {
            numCount[ num, default:0 ] += 1
        }

        let sortedByFrequency = numCount.sorted{$0.value > $1.value}

        return Array(sortedByFrequency.prefix(k).map{$0.key})
    }
}