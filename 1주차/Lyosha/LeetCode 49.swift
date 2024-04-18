// https://leetcode.com/problems/group-anagrams/

class Solution {
    func sortedString(_ s: String) -> String {
        var arr: [Character] = []
        for c in s{
            arr.append(c)
        }
        
        arr = arr.sorted()
        let joinedString = String(arr)
        return joinedString
    }

   
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var anagramDict: [String: [String]] = [:]

        for i in 0..<strs.count {
            var sortedStr = sortedString(strs[i])
            if anagramDict[sortedStr] == nil { 
                anagramDict[sortedStr] = [strs[i]]
            }
            else {
                anagramDict[sortedStr]!.append(strs[i])
            }
        }

        return Array(anagramDict.values)
    }
}
