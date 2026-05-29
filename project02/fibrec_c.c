int fibrec_c(int n) {
    if (n <= 1) {
        return n;
    }
    return fibrec_c(n - 1) + fibrec_c(n - 2);
}
