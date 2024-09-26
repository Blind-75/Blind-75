class Solution {
    func alienOrder(_ words: [String]) -> String {
        var dictionary = [Character: [Character]]()
        for index in 1..<words.count {
            var wordA = Array(words[index - 1])
            var wordB = Array(words[index])

            var minLength = min(wordA.count, wordB.count)
            if wordA.count > wordB.count && wordA[..<minLength] == wordB[..<minLength] {
                return ""
            }
            for charIndex in 0..<minLength {
                if wordA[charIndex] != wordB[charIndex] {
                    var list = dictionary[wordA[charIndex], default: []]
                    list.append(wordB[charIndex])
                    dictionary[wordA[charIndex]] = list
                    break
                }
            }
        }

        var cycleVisited = Set<Character>()
        var visited = [Character: Bool]()
        var result = []

        func dfs(item: Character) -> Bool {
            if cycleVisited.contains(item) {
                return true
            }
            
            cycleVisited.insert(item)

            if let neighbours = dictionary[item] {
                for neighbour in neighbours {
                    if dfs(item: neighbour) {
                        return true
                    }
                }
            }

            visited[item] = true 
            cycleVisited.remove(item)
            result.append(item)
        }

        dictionary.forEach { key, neighbours in 
            if dfs(item: key) {
                return ""
            }
        }

        var letters = Set(words.joined())

        for letter in letters {
            guard let exists = visited[letter], exists else {
                result.append(letter)
            }
        }

        result.reverse()

        return String(result)

    }
}