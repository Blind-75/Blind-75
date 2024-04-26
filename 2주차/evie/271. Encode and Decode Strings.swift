// Encoder : 배열을 문자열로 변환
// Decoder : 문자열을 배열로 변환

class Solution {
    private var charDict: [Character: String] = [:]

    func encode(_ strs: [String]) -> String {
        var encodedString = ""
        var count = 1
        
        for str in strs {
            for char in str {
                if !charDict.keys.contains(char) {
                    charDict[char] = String(count)
                    count += 1
                }
                encodedString += charDict[char]! + ","
            }
            encodedString += " "
        }
        
        return encodedString
    }
    
    func decode(_ s: String) -> [String] {
        var decodedStrings: [String] = []
        let encodedChars = s.split(separator: " ")
        
        for encodedChar in encodedChars {
            var decodedStr = ""
            let encodedCharsInStr = encodedChar.split(separator: ",")
            for encoded in encodedCharsInStr {
                for (char, encoding) in charDict {
                    if encoding == String(encoded) {
                        decodedStr.append(char)
                        break
                    }
                }
            }
            decodedStrings.append(decodedStr)
        }
        
        return decodedStrings
    }
}