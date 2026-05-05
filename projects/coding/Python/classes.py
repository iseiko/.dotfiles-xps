eachClass = 40
pedro = 53
wings = 7.6
northWest = 20
southWest = 15.20

# c = int(input("How many classes you had on the northWest?: "))
c = int(input("How many to pedro?: "))
b = int(input("How many classes you had on the southWest?: "))
a = int(input("How many classes you had on the wings?: "))

classTotal = (a+b)*eachClass + (c*pedro)
moving = (a*wings) + (b*southWest) + (c*wings) #+ (c*northWest)

print(f'You will get {classTotal} for the classes, {moving} to move and {classTotal+moving} in total!')