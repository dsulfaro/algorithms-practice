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

class SetOfStacks(object):

    def __init__(self, size):
        self.stacks = [[]]
        self.size = size

    def last_length(self):
        return len(self.stacks[-1])

    def last_stack(self):
        return self.stacks[-1]

    def push(self, val):
        if self.last_length() == self.size:
            self.stacks.append([val])
        else:
            self.last_stack().append(val)

    def pop(self):
        self.last_stack().pop()
        if self.last_length() == 0:
            self.stacks.pop()

    def popAt(self, idx):
        self.stacks[idx].pop()
        if len(self.stacks[idx]) == 0:
            del self.stacks[idx]
