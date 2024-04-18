class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var myDict = [String : [String]]()
        var result = [[String]]()
        for i in strs{
            var sorted = i.sorted()
            if let value = myDict[String(sorted)]{
                myDict[String(sorted)]?.append(i)
            }else{
                myDict.updateValue([i], forKey: String(sorted))
            }
        }
        myDict.forEach{key, value in
            result.append(value)
        }
        if result.isEmpty{
            return [[""]]
        }
        return result
    }
}