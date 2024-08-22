class Solution {
    var board : [[Character]] = []
    var word: [Character] = []
    var mystack: [[Int]] = []
    var visited: [[Bool]] = []


    func exist(_ board: [[Character]], _ word: String) -> Bool {
        self.board = board
        self.word = Array(word)
        self.visited = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
        
        for (i, row) in board.enumerated(){
            for (j, element) in board[i].enumerated(){ 
                if board[i][j] == self.word[0]{
                    self.mystack = [[i, j]]
                    self.visited = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
                    self.visited[i][j] = true
                    if let answer = self.dfs(0) {
                        if answer == true {
                            return true
                        }
                    }
                }
            }
        }
        return false
    }

    func isValid(_ i: Int, _ j: Int) -> Bool{
        if 0 <= i && i <= self.board.count-1 && 0 <= j && j <= self.board[0].count-1 { 
            return true
        }
        return false
    }

    func dfs(_ depth: Int )-> Bool?{
        let dxs = [1, 0, -1, 0]
        let dys = [0, 1, 0, -1]

        if depth == self.word.count-1 {
            return true
        }

        else { 
            let curr = self.mystack[self.mystack.count-1]
            for (dx, dy) in zip(dxs, dys){ 
                let next_row = curr[0] + dy
                let next_col = curr[1] + dx
                if self.isValid(next_row, next_col) { 
                    if self.visited[next_row][next_col]==false { 
                        if self.board[next_row][next_col] == self.word[depth+1]{
                            self.mystack.append([next_row, next_col])
                            self.visited[next_row][next_col] = true
                            var ret = self.dfs(depth+1)
                            if let ret = ret {
                                return ret
                            }
                            self.visited[next_row][next_col] = false
                            self.mystack.removeLast()
                        }
                    }
                }
            }
        }
        return nil
    }
}
