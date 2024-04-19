class Solution {

    func isAnagram_0(_ s: String, _ t: String) -> Bool {
        return s.sorted() == t.sorted()
    }

    func isAnagram_1(_ s: String, _ t: String) -> Bool {

         if s.count != t.count {
               return false 

        var memo = [Character:Int]()

        for c in s {
            // 해당 key가 처음 들어왔을때 value 값 0 , 이미 존재하는 경우에는 count +1
            memo[c, default: 0] += 1
        }

        for c in t {
            // memo에 해당 key가 존재하면 
            if let count = memo[c]{
                // key에 대한 value 1 줄이고
                memo[c] = count - 1
                if memo[c]! < 0 {
                    return false 
                }
            } else {
                return false 
            }
            
        }
        return true 
    }
    
    
    }
}