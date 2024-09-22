// CECS 342
// Assignment 1
// Group 7
// Minhlee Lam, Tiffany Lin
// Kenneth Samaniego, Justin Short

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

void merge(int *a, int *b, int a_len, int b_len) {
    // Allocate memory for temporary array
    int *temp= (int*)malloc((a_len+b_len)*sizeof(int));

    // Initialize variables to track indices
    int index_left = 0;
    int index_right = 0;
    int index_main = 0;

    // While either list still has elements
    // Insert the smallest element next in temp array
    while ((index_left < a_len) || (index_right < b_len)) {
        if ((index_left == a_len) && (index_right < b_len)) {
            temp[index_main] = b[index_right];
            index_right++;
        } else if ((index_right == b_len) && (index_left < a_len)) {
            temp[index_main] = a[index_left];
            index_left++;
        } else if (a[index_left] <= b[index_right]) {
            temp[index_main] = a[index_left];
            index_left++;
        } else {
            temp[index_main] = b[index_right];
            index_right++;
        }
        index_main++;
    }
    // Update list segment to be in sorted order
    for (int i = 0; i < a_len+b_len; i++) {
        if (i < a_len) {
            a[i] = temp[i];
        } else {
            b[i - a_len] = temp[i];
        }
    }
    // Free memory used for temp array
    free(temp);
}


void merge_sort(int *a, int n) {
    // Calculate middle of list
    // (Odd length lists will have extra
    //  element on right side of split)
    int mid = n/2;
    int size_left = n/2;
    int size_right = n/2;

    // Account for odd lenght lists
    if (n%2 == 1) size_right++;

    // Pointers to starting element of the 2 sublists
    int *left = a;
    int *right = a + mid;

    // If lists are larger than 1 element,
    // Recursively split them
    if (size_left > 1) merge_sort(left, size_left);
    if (size_right > 1) merge_sort(right, size_right);

    // Merge lists back together
    merge(left, right, size_left, size_right);
}

void print_int_list(int *list, int size) {
    // Prints a list of integers
    for (int i = 0; i < size; i++)
        printf("%d ", list[i]);
    printf("\n");
}

int main() {
    printf("Test Case 1\n");
    // Test case with a list of an even number of integers
    // containing positives, negatives, and zero
    int nums1[] = {1, 3, 4, 2, 20, 7, 5, -1, 60, 0};
    print_int_list(nums1, 10);
    merge_sort(nums1, 10);
    print_int_list(nums1, 10);
    printf("\n");

    printf("Test Case 2\n");
    // Test case with a list of an odd number of intergers
    // containing positives, negatives, and zero
    int nums2[] = {1, 3, 9, -2, 5, 12, -6, 0, 4};
    print_int_list(nums2, 9);
    merge_sort(nums2, 9);
    print_int_list(nums2, 9);
    printf("\n");

    printf("Test Case 3\n");
    // Test case with a list containing several duplicates
    int nums3[] = {1, 2, 4, 1, 2, 4, 2, 2, 4, 4, 2, 2};
    print_int_list(nums3, 12);
    merge_sort(nums3, 12);
    print_int_list(nums3, 12);

    return 0;
}
