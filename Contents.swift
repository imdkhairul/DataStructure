//: Playground - noun: a place where people can play


public struct Queue<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public var front: T? {
        return array.first
    }
}

// Binary Search Tree

class BstNode
{
    var data = 0
    var leftNode:BstNode?
    var rightNode:BstNode?
}

func getNewNode(data:Int) -> BstNode
{
    let node = BstNode()
    node.data = data
    return node
}

func insert(root:BstNode?,data:Int) ->BstNode?
{
    if root == nil{
        return getNewNode(data: data)
    }
    else if data <= (root?.data)!
    {
        root?.leftNode = insert(root: root?.leftNode, data: data)
    }
    else
    {
        root?.rightNode = insert(root: root?.rightNode, data: data)
    }
    return root
}

func search(root:BstNode?,data:Int) -> Bool
{
    if root == nil
    {
        return false
    }
    if data == root?.data
    {
        return true
    }
    else if data <= (root?.data)!
    {
        return search(root: root?.leftNode, data: data)
    }
    else
    {
        return search(root: root?.rightNode, data: data)
    }
}

func findMin(root:BstNode?) -> BstNode?
{
    if root == nil
    {
        return nil
    }
    else if (root?.leftNode == nil)
    {
        return root
    }
    return findMin(root: root?.leftNode)
}

func findMax(root:BstNode?) -> Int?
{
    if root == nil
    {
        return -1
    }
    else if (root?.rightNode == nil)
    {
        return root?.data
    }
    return findMax(root: root?.rightNode)
}

func findHeight(root:BstNode?) -> Int
{
    if root == nil
    {
        return -1
    }
    else
    {
        return max(findHeight(root:root?.leftNode), findHeight(root:root?.rightNode)) + 1
    }
}

func deleteNode(root:BstNode?,data:Int) -> BstNode?
{
    var root = root
    if root == nil
    {
        return root
    }
    else if data < (root?.data)!
    {
        root?.leftNode = deleteNode(root: root?.leftNode, data: data)
    }
    else if data > (root?.data)!
    {
        root?.rightNode = deleteNode(root: root?.rightNode, data: data)
    }
    else
    {
        // Case 1: No child
        if root?.leftNode == nil && root?.rightNode == nil
        {
            root = nil
        }
            // Case 2: One child
        else if root?.leftNode == nil
        {
            var temp = root
            root = root?.rightNode
            temp = nil
        }
        else if root?.rightNode == nil
        {
            var temp = root
            root = root?.leftNode
            temp = nil
        }
        else{
            let temp = findMin(root: root?.rightNode)
            root?.data = (temp?.data)!
            root?.rightNode = deleteNode(root: root?.rightNode, data: (temp?.data)!)
            
        }
    }
    return root
}

func levelOrder(root:BstNode?)
{
    if root == nil
    {
        return
    }
    var queue:Queue<BstNode> = Queue.init()
    queue.enqueue(root!)
    while(!queue.isEmpty)
    {
        let node = queue.front
        print((node?.data)!)
        if node?.leftNode != nil
        {
            queue.enqueue((node?.leftNode)!)
        }
        if node?.rightNode != nil
        {
            queue.enqueue((node?.rightNode)!)
        }
        queue.dequeue()
    }
}

func preOrderTraverSal(root:BstNode?)
{
    if root == nil
    {
        return
    }
    print((root?.data)!)
    preOrderTraverSal(root: root?.leftNode)
    preOrderTraverSal(root: root?.rightNode)
}

func inOrderTraversal(root:BstNode?)
{
    if root == nil
    {
        return
    }
    inOrderTraversal(root: root?.leftNode)
    print((root?.data)!)
    inOrderTraversal(root: root?.rightNode)
}

func postOrderTraversal(root:BstNode?)
{
    if root == nil
    {
        return
    }
    postOrderTraversal(root: root?.leftNode)
    postOrderTraversal(root: root?.rightNode)
    print((root?.data)!)
}

var root:BstNode? = nil
root = insert(root: root, data: 50)
root = insert(root: root, data: 20)
root = insert(root: root, data: 10)
root = insert(root: root, data: 60)
root = insert(root: root, data: 70)
root = insert(root: root, data: 80)

search(root: root, data: 110)
findMin(root: root)
findMax(root: root)

inOrderTraversal(root: root)

findHeight(root: root)
deleteNode(root: root, data: 50)
levelOrder(root: root)
