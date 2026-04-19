# Required software, tools, or dependencies

- Virtualization software (VirtualBox, VMWare)
- Linux Mint OVA provided in Google Classroom

# Step-by-step instructions to set up the project

1. Clone the repository and go to the mcertikos directory

```bash
git clone https://github.com/musaddiq-rafi/Advanced-Memory-Allocation.git
cd Advanced-Memory-Allocation/mcertikos/
```

2. Run the following commands

```bash
make clean
make TEST=1
```

# How to verify that the project is working correctly

After running ``` make TEST=1 ```, if there are no compilation errors, the test cases will run. All the test cases are printed, it means that the project is working correctly.

# Sample test case output

Output for ```mcertikos/pmm/MATIntro/test.c```

```
own test: begin (page_idx=2)
own test: orig order=0
own test: set order=0
own test: set order=1
own test: set order=5
own test: set order=10
own test: set order=3
own test: set order=7
own test: restored order=0
own test: orig head=0
own test: set head=1 -> at_is_head=1
own test: set head=0 -> at_is_head=0
own test: restored head=0
own test passed.
```