#include <stdio.h>
#include <string.h>

/* int main(){
    int a,b,result;
    char op[2];
    printf("Input a: ");
    scanf("%d",&a);
    printf("Input the operation: ");
    scanf("%s",op);
    printf("Input b: ");
    scanf("%d",&b);
    if (strcmp(op,"+")==0) {
        result = a+b;
    } else if (strcmp(op,"-")==0) {
        result = a-b;
    }
    printf("\nthe result is: %d\n",result);
    return 0;
} */

/* int main() {
    int count, sum, num = 0, countAbove;
    while (num!=-1) {
        printf("Input the wheight, press -1 to exit: ");
        scanf("%d",&num);
        if (num!=-1) {
            sum += num;
            count ++;
        }
        if (num>600) {
            countAbove++;
        }
    }
    printf("there are %d animals\nthe total wheight is %d\nthe average is
%d\nand there are %d above 600kg\n",count,sum,sum/count,countAbove);
} */

/* int main() {
    int lower = 9999999,age,count=0,sum=0;
    for (int i = 0; i<50; i++) {
        printf("Input the age: ");
        scanf("%d", &age);
        count++;
        sum+=age;
        if (age<lower) {
            lower = age;
        }
    }
    printf("\nThe sum of ages is %d\nThe average is %d\nAnd the younger is
%d\n",sum,sum/count,lower); return 0;
} */

