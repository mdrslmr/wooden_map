# wooden_map
Simple map for wooden puzzle solution.

Following up on https://glocq.github.io/en/blog/20250428/

I tried to print the solution in a way that let's me
understand how to build the wooden puzzle.

Well it is still not easy, but it worked for my puzzle.

The idea is to give the bits of the general peace symbolic names like this:

```
    E
A B C D
```

Then turn the solution, which consists of coordinates, in to layers and put the symbols into the layers.

So this gives 5 two dimensional 5x5 plots of symbols.

The first may be the bottom layer.

Then the peaces have to be put according to the plots.

The difficulty is, that one has to look ahead in several layers to make sure a peace is not placed in the wrong rotation.

The code contains a hard-coded solution.

The output is static therefore and it looks like this:

```
The symbols are releated to the peace like this: 

    E  
A B C D


A D C B A
B A B C D
C A E E E
D D C B A
A A B C D

D A E A A
D C B A B
E B E E C
A B C D D
B D A E A

C B A B D
E E B D C
E C C C B
E E D B A
C C B A B

B C E C E
D C B A E
E D E E E
D C B A E
D B C E C

A D A D A
D E B D B
C E C C C
B E D B D
A A D A D

```



