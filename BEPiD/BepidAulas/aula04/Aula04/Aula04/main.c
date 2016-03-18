//
//  main.c
//  Aula04
//
//  Created by Danilo Barros Mendes on 2/11/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void heap(int *array, int N){
    
        if(N==0)
            return;
        
        int t;
        unsigned int n = N, parent = N/2, index, child;
    
        while (1) {
            if (parent > 0) {
                
                t = array[--parent];
            } else {
                
                n--;
                if (n == 0) {
                    return;
                }
                t = array[n];
                array[n] = array[0];
            }
            
            index = parent;
            child = index * 2 + 1;
            while (child < n) {
                if (child + 1 < n  &&  array[child + 1] > array[child]) {
                    child++;
                }
                
                if (array[child] > t) {
                    array[index] = array[child];
                    index = child;
                    child = index * 2 + 1;
                } else {
                    break;
                }
            }
            
            array[index] = t;
        }
    
}

int main(int argc, const char * argv[]) {
    int *pnt, n;
    
    srand(time(NULL));
    
    scanf("%d", &n);
    
    pnt = (int *)malloc(n*sizeof(int));
    
    for(int i=0; i<n; i++){
        int random = rand();
        pnt[i] = random;
    }
    
    heap(pnt, n);
    
    puts("");
    for(int i=0; i<n; i++)
        printf("%d\t", pnt[i]);
    
    
    
    return 0;
}
