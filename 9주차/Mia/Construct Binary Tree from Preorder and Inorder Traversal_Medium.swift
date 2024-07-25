class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard !preorder.isEmpty || !inorder.isEmpty else {return nil}
        var preorder = preorder
        var root = TreeNode(preorder.removeFirst())
        var index = inorder.index(of: root.val)
        guard let rootIndex = index else {return nil}
        var leftInorder = inorder[..<rootIndex]
        var rightInorder = inorder[(rootIndex + 1)...]
        var leftPreorder = preorder[..<leftInorder.count]
        var rightPreorder = preorder[leftInorder.count...]

        root.left = buildTree(Array(leftPreorder), Array(leftInorder))
        root.right = buildTree(Array(rightPreorder), Array(rightInorder))

        return root
    }
}