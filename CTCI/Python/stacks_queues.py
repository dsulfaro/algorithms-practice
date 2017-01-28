class FixedMultiStack(object):

    def __init__(self, size):
        self.numStacks = 3
        self.stackSize = size
        self.values = [None] * (3 * size)
        self.sizes = [0] * 3

    def push(self, stack, val):
        if self.sizes[stack] == self.stackSize:
            print ("This stack is full")
            return False
        else:
            offset = self.sizes[stack]
            self.values[(stack * 3) + offset] = val
            self.sizes[stack] += 1
            return True

    def pop(self, stack):
        if self.sizes[stack] == 0:
            print ("This stack is empty")
            return False
        else:
            offset = self.sizes[stack]
            self.values[(stack * 3) + offset - 1] = None
            self.sizes[stack] -= 1
            return True

    def peek(self, stack):
        offset = self.sizes[stack]
        return self.values[(stack * 3) + offset - 1]

    def size(self, stack):
        return self.sizes[stack]
