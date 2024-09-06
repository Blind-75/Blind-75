class TrieNode {
    let value: Character?
    var children: [Character: TrieNode]
    var isWord: Bool
    
    init(_ inputValue: Character? = nil) {
        self.value = inputValue
        self.children = [:]
        self.isWord = false
    }
}

class WordDictionary {
    let root: TrieNode
    var mystack: [TrieNode]
    
    init() {
        root = TrieNode()
        mystack = []
    }
    
    func addWord(_ word: String) {
        var currNode = self.root
        for (i, c) in word.enumerated() {
            if currNode.children[c] == nil {
                currNode.children[c] = TrieNode(c)
            }
            let childNode = currNode.children[c]!
            currNode = childNode
        }
        currNode.isWord = true
    }
    
    func dfs( _ wordArr: [Character], _ depth: Int) -> Bool{
        var curr: TrieNode = self.mystack.last!
        var c = wordArr[depth]
        
        if depth == wordArr.count-1 { // word의 마지막일 경우
            if wordArr[depth] == "." {
                if curr.isWord{
                    return true
                }
                return false
            }
            
            if curr.value == wordArr[depth] && curr.isWord {
                return true
            }
            return false
        } else {
            if c != "." && curr.value != wordArr[depth] {
                return false
            }
            if wordArr[depth+1] != "." && curr.children[wordArr[depth+1]] == nil {
                return false
            }
            if wordArr[depth+1] == "." { // 와일드카드일 때
                for c in curr.children.keys {
                    self.mystack.append(curr.children[c]!)
                    if dfs(wordArr, depth+1){
                        return true
                    }
                    self.mystack.removeLast()
                    // self.mystack.removeLast()
                }
            } else {
                if curr.children[wordArr[depth+1]] == nil {
                    return false
                }
                self.mystack.append(curr.children[wordArr[depth+1]]!) //여기가 문제
                return self.dfs(wordArr, depth+1)
            }
        }
        return false
    }
    
    func search(_ word: String) -> Bool {
        // 와일드카드가 있음 → dfs로 해야함
        if word == "" {
            return true
        }
        
        let wordArr = Array(word)
        if wordArr[0] != "." {
            if self.root.children[wordArr[0]] == nil {
                return false
            }
            self.mystack.append(self.root.children[wordArr[0]]!)
            return self.dfs(wordArr, 0)
        } else {
            for c in self.root.children.keys {
                self.mystack = [self.root.children[c]!]
                if self.dfs(wordArr, 0){
                    return true
                }
            }
            return false
        }
    }
}