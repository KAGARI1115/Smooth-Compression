# Smooth-Compression
An implementation of Smooth Huffman Coding

A modification to Huffman coding, so that if $c(x)$ is the compressed version for $x$, and $y$ differs from $x$ in several point edits, then 
$c(y)$ has a limited edit distance from $c(x)$.
