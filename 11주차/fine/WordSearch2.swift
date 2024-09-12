class TrieNode {
    var children: [Character: TrieNode] = [:]
    var word: String?
}

class Solution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let root = buildTrie(words)
        var result: Set<String> = []
        let m = board.count
        let n = board[0].count
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        
        for i in 0..<m {
            for j in 0..<n {
                dfs(board, i, j, root, &visited, &result)
            }
        }
        
        return Array(result)
    }
    
    private func buildTrie(_ words: [String]) -> TrieNode {
        let root = TrieNode()
        for word in words {
            var node = root
            for char in word {
                if node.children[char] == nil {
                    node.children[char] = TrieNode()
                }
                node = node.children[char]!
            }
            node.word = word
        }
        return root
    }
    
    private func dfs(_ board: [[Character]], _ i: Int, _ j: Int, _ node: TrieNode, _ visited: inout [[Bool]], _ result: inout Set<String>) {
        guard i >= 0 && i < board.count && j >= 0 && j < board[0].count && !visited[i][j] else {
            return
        }
        
        let char = board[i][j]
        guard let nextNode = node.children[char] else {
            return
        }
        
        if let word = nextNode.word {
            result.insert(word)
        }
        
        visited[i][j] = true
        
        let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        for (dx, dy) in directions {
            dfs(board, i + dx, j + dy, nextNode, &visited, &result)
        }
        
        visited[i][j] = false
    }
}

