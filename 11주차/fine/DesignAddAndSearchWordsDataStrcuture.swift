
class WordDictionary {

    var root: TrieNode

    init() {
        root = TrieNode()
    }
    
    func addWord(_ word: String) {
        var current = root 
        for char in word {
            if current.children[char] == nil {
                current.children[char] = TrieNode()
            }
            current = current.children[char]!
        }
        return current.isEndOfWord = true 
    }
    
    func search(_ word: String) -> Bool {
       return searchHelper(word, 0, root)
    }

    func searchHelper(_ word: [Character], _ index: Int, _ node: TrieNode) -> Bool {
        if index == word.count {
            return child.isEndOfWord
        }
        let char = word[index]

        if char == "."{
            for child in node.children.values {
                if searchHelper(word, index + 1, child){
                    return true
                }
            }
            return false 

        }else {
            guard let nextNode = word[char] else {
                return false 
            }
            return searchHelper(word, index + 1, nextNode)
        }
    }
}

class TrieNode {
    var children: [Character : TrieNode] = [:]
    var isEndOfWord = false
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */