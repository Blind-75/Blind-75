class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var anagrams = [String : [String]]()

        for str in strs {

            // str.sorted는 [Character]를 반환하기 때문에 String()
            let key = String(str.sorted())
            // 딕셔너리에서 해당 키가 존재하지 않는 경우 nil 
            if  anagrams[key] == nil {
                anagrams[key] = [str]
            } 
            anagrams[key]?.append(str)
        }
        return Array(anagrams.values)
    }
}