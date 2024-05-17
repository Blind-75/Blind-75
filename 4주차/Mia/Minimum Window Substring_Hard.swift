// time limit exceeds T.T
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        var currentString = [Character]()
        var result = ""
        var sDict = [Character: Int]()
        var tDict = [Character: Int]()
        var tCheck = [Character: Bool]()
        var char = Array(s)
        var p1 = 0

        for i in Array(t){
            tDict[i, default: 0] += 1
            tCheck[i] = false
            sDict[i] = 0
        }
        for (p2, end) in char.enumerated(){
            if let value = tDict[end]{
                sDict[end, default: 0] += 1
            }
            currentString.append(end)
            var filter = tDict.filter{$0.value > sDict[$0.key]!}
            while filter.isEmpty{
                if result.count == 0{
                    result = String(currentString)
                }else if result.count > currentString.count{
                    result = String(currentString)
                }
                currentString.remove(at:0)
                if let value = sDict[char[p1]]{
                    sDict[char[p1]]! -= 1
                    if sDict[char[p1]]! < tDict[char[p1]]!{
                        p1 += 1
                        break
                    }
                }
                p1 += 1
            }
        }
        return result
    }
}