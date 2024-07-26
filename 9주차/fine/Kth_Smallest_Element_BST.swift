public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack: [TreeNode] = []
        var current = root 
        var count = 0

        while current != nil || !stack.isEmpty {
            while current != nil {
                stack.append(current!)
                current = current!.left
            }

            current = stack.removeLast()
            count += 1

            if count == k {
                return current!.val 
            }

            current = current!.right
        }

        return -1 
    }
}