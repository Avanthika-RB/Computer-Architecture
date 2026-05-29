int max2_c(int a, int b) {
    return a > b ? a : b;
}

int findmaxfc_c(int arr[], int len) {
    int i;
    int v;
    int max;

    max = arr[0];

    for (i = 1; i < len; i++) {
        v = arr[i];
        max = max2_c(max, v);
    }        

    return max;
}
