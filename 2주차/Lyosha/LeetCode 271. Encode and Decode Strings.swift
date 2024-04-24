// https://leetcode.com/problems/encode-and-decode-strings/description/
import Foundation

class Codec {
    var charDict: [Character: String] = [:]
    var decodeDict: [String: Character] = [:]
    func encode(_ strs: [String]) -> String {
        var count = 1
        for str in strs{
            for char in str{
                if !(self.charDict.contains{$0.key == char}) {
                    self.charDict[char, default: ""] = String(count)
                    self.decodeDict[String(count)] = char
                    count += 1
                }
            }
        }
        
        var encodedString = ""
        for str in strs{
            for char in str{
                var encodedChar = self.charDict[char, default: ""]
                encodedString += " " + encodedChar
                encodedString += " " + String(257)
            }
        }
        
        return encodedString
    }
    
     func decode(_ s: String) -> [String] {
         let chars = s.components(separatedBy: " ")
         var ans: [String] = []
         var decodedString = ""
         for char in chars {
             
         }
     }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * val s = obj.encode(strs)
 * let ans = obj.decode(s)
 */
