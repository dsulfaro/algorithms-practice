import types
import importlib.machinery
loader = importlib.machinery.SourceFileLoader('bst', './../../../datastructures/python/bst.py')
BST = types.ModuleType(loader.name)
handle = loader.exec_module(BST)

# b = BST.BST()
# b.root = b.insert(2, b.root)
# b.insert(1, b.root)
# b.insert(3, b.root)
# b.inorder(b.root)

class Node(object):
    def __init__(self, val, neighbors):
        self.val = val
        self.neighbors = neighbors

    def add_neighbor(self, other_node):
        self.neighbors.append(other_node)

    def delete_neighbor(self, victim):
        self.neighbors.remove(victim)

class Graph(object):
    def __init__(self):
        self.adj = {}

    def add_node(self, node):
        self.adj[node] = node.neighbors

    def delete_node(self, node):
        del self.adj[node]

    def dfs(self, start, finish):
        stack = [start]
        while len(stack) != 0:
            node = stack.pop()
            if node.val == finish.val:
                return True
            stack += node.neighbors
        return "No Path from " + start.val + " to " + finish.val

    def bfs(self, start, finish):
        queue = [start]
        while len(queue) != 0:
            node = queue.pop(0)
            if node.val == finish.val:
                return True
            queue += node.neighbors
        return "No Path from " + start.val + " to " + finish.val

gr = Graph()
a = Node("A", [])
b = Node("B", [])
c = Node("C", [])
d = Node("D", [])
e = Node("E", [])
f = Node("F", [])
g = Node("G", [])
a.add_neighbor(b)
a.add_neighbor(c)
b.add_neighbor(d)
c.add_neighbor(f)
d.add_neighbor(e)
e.add_neighbor(g)
gr.add_node(a)
gr.add_node(b)
gr.add_node(c)
gr.add_node(d)
gr.add_node(e)
print(gr.bfs(a, d))
