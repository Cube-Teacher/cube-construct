import os

print()
print()
print("\033[1;32m     🚧️🚧️🚧️🚧️🚧️🚧️🚧️🚧️🚧️🚧️  Building 🚧️🚧️🚧️🚧️🚧️🚧️🚧️🚧️🚧️🚧️\033[0m")
print()
print()

os.system("python3 gen.py")

print()
print()
print("\033[1;32m     🤖️🤖️🤖️🤖️🤖️🤖️🤖️🤖️🤖️🤖️  Solving 🤖️🤖️🤖️🤖️🤖️🤖️🤖️🤖️🤖️🤖️\033[0m")
print()
print()

os.system("python3 sol.py")

print()
print()
print("\033[1; 32m     🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️ Answering 🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️🚀️\033[0m")
print()
print()

os.system("python3 make.py")

print()
print()
print("\033[1; 32m     👀️👀️👀️👀️👀️👀️👀️👀️👀️👀️ Checking 👀️👀️👀️👀️👀️👀️👀️👀️👀️👀️\033[0m")
print()
print()

os.system("python3 check.py")
