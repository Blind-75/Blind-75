class Soution {
    func encode( _strs: [String]) -> String {
        var encdoeString = ""
        for str in strs {
            encdoeString += "\(str.count)#\(str)"
        }
        return encdoeString
    }

    func decode(_ s: String) -> [String]{
        var strs = [String]()
        var i = 0
        let characters = Array(s) // 문자열 넣으면 character 배열로 반환 

        while i < characters.count {
            var j = i
            while characters[i] != "#"{
                j += 1
            }
            let length = Int(String(characters[i..<j]))!
            j += 1

            let str = String(characters[j..<j+length])
            strs.append(str)
            i = j + length
            }

            return strs 
    }

}