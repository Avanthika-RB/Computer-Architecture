int findmax_c(int arr[], int len) {
    int i;
    int v;
    int max;

    max = arr[0];

    for (i = 1; i < len; i++) {
        v = arr[i];
        if (v > max) {
            max = v;
        }
    }        

    return max;
}
