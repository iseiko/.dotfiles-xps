import random

num, op = float(input('Enter a number: ')), input('Enter an operation, either + or x: ')

if op == 'x':
    for i in range(1,11):
        print(f'{i:2} x {num} = {i*num:2}')
elif op == '+':
    for i in range(1,11):
        print(f'{i:2} + {num} = {i+num:2}')
else:
    print('Not a valid operation')