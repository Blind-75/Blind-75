import Foundation

class Codec {
    var charDict: [Character: String] = [:]
    var decodeDict: [String: Character] = [:]
    func encode(_ strs: [String]) -> String {
        
        //charDict, decodeDict를 만들기
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
        
        //만들어진 decodeDict를 바탕으로 encode하기
        var encodedString = ""
        for str in strs{
            for char in str{
                var encodedChar = self.charDict[char, default: ""]
                encodedString += " " + encodedChar
            }
            encodedString += " " + String(257)
        }
        
        return encodedString
    }
    
    
     func decode(_ s: String) -> [String] {
         let chars = s.components(separatedBy: " ")
         var ans: [String] = []
         var decodedString = ""
         print(chars)

         for char in chars {
             if char == "" {
                 continue
             }
             if char == String(257){
                 ans.append(decodedString)
                 decodedString = ""
                 continue
             }
             let decodedChar: Character = self.decodeDict[char]!
             decodedString.append(decodedChar)
         }
         return ans
         
     }
}