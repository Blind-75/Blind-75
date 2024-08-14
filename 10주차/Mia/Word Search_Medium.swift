class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var charArray = Array(word)
        var rows = board.count 
        var cols = board[0].count 
        var seen = [Int : Bool]()

        for i in 0..<rows{
            for j in 0..<cols{
                if checkCharacter(i, j, 0){
                    return true
                }
            }
        }

        return false

        func checkCharacter(_ row: Int, _ col: Int, _ wordIndex: Int) -> Bool{
            guard row >= 0, row < rows, col >= 0, col < cols, seen[row * cols + col] != true, wordIndex < charArray.count, board[row][col] == charArray[wordIndex] else {return false}
            if charArray.count == wordIndex + 1 {
                return true
            }
            seen[row * cols + col] = true 

            var left = checkCharacter(row, col - 1, wordIndex + 1)
            var right = checkCharacter(row, col + 1, wordIndex + 1)
            var top = checkCharacter(row - 1, col, wordIndex + 1)
            var bottom = checkCharacter(row + 1, col, wordIndex + 1)

            seen[row * cols + col] = false 

            return left || right || top || bottom 
        }
    }
}