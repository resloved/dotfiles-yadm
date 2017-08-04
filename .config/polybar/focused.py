#!/usr/bin/env python3
import i3ipc

# fix scratchpad/floating

i3 = i3ipc.Connection()
foc = i3.get_tree().find_focused()

cur = foc.parent

loc = [1,1]

layer = 'nodes'
tag = '*'

if foc.parent.type == 'floating_con':
    layer = 'floating_' + layer
    tag = '^'

while True:
    split = cur.orientation
    if split != 'none':
        for node in getattr(cur, layer):
            if node is foc:
                break
            elif split == 'vertical':
                loc[0] += 1
            elif split == 'horizontal':
                loc[1] += 1
    if cur == foc.workspace():
        break
    foc = cur
    cur = cur.parent
print(str(loc[0]) + tag +str(loc[1]))
