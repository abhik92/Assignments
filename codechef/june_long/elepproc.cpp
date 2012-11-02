/*
 * Author : Karthik Abinav
 */

#include <vector>
#include <list>
#include <map>
#include <set>
#include <deque>
#include <stack>
#include <queue>
#include <bitset>
#include <algorithm>
#include <functional>
#include <numeric>
#include <utility>
#include <sstream>
#include <iostream>
#include <iomanip>
#include <cstdio>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <cctype>
#include <string>
#include <climits>
#include <cassert>
#include <string.h>
#include <stdint.h>
#include <unistd.h>

/*All global definitions */
#define INF 1000000000

#define for_inc(start,end,increment)for(i=start;i<end;i+=increment)
#define for_dec(start,end,decrement)for(i=start;i>end;i-=decrement)

#define inp_d(n)scanf("%d",&n)
#define inp_ld(n)scanf("%ld",&n)
#define inp_lld(n)scanf("%lld",&n)
#define inp_s(n)scanf("%s",n)
#define inp_c(n)scanf("%c",&n)

#define out_d(n)printf("%d",n)
#define out_ld(n)printf("%ld",n)
#define out_lld(n)printf("%lld",n)
#define out_s(n)printf("%s",n)
#define out_c(n)printf("%c",n)
#define out_nl()printf("\n");

#define v_size(A) ((int)(A.size()))
#define set(A,x) memset(A,x,sizeof(A));  
#define pb push_back
#define mp make_pair

#define MAX 500
#define mod 1000007

using namespace std;
char l[20],r[20];
int product()
{
    long long int nu = 0;
    int i;
    int c4 = 0,c7=0;
 
    for(i=0;i<strlen(l);i++)
    {
        nu = nu*10 + (l[i]-'0');
        if(l[i] == '4')c4++;
        else if(l[i] == '7') c7++;
    }
 
    
        return c4*c7;    
    
}
int next_num()
{
    int len = strlen(l);
    int i;
    for(i=len-1;i>=0;i--)
    {
        if(l[i] >= '7')
        {
            l[i] = '4';

        }
        else
        {
            if(l[i] != '9')
            {
                if(l[i] == '4')
                    l[i] ='7';
                else l[i]++;

                return 0;

            }
            else
            {
                if(i-1 >= 0)
                {
                    l[i-1]++;
                    l[i] = '4';
                    return 0;

                }
                else
                    return -1;


            }


        }


    }

    return -1;
}


int main()
{
    int t;
    inp_d(t);

    while(t--)
    {
        inp_s(l);
        inp_s(r);

        char dd[20];
        int i;
        int lenl = strlen(l);
        int lenr = strlen(r);

        int j = lenl-1;
        for(i=lenr-1;i>=0;i--)
        {
            if(j>=0)
                l[i] = l[j];
            else
                l[i] = '0';
            j--;

        }
        l[lenr] = '\0';       
        
     int temp = 0;
     int maxp = 0;
        while(temp!=-1) 
        {
            
            temp = product();
            if(temp>maxp)
                maxp = temp;
        
            temp = next_num();
            if(temp==-1)
                break;
            
            int j;
            for(j=0;j<lenr;j++)
            {
                if(l[j]>r[j])
                {
                    temp = -1;
                    break;
                }
                else if(l[j] < r[j])
                    break;


            }
            if(temp == -1)
                break;


        }
        out_d(maxp);
        out_nl();        
    }
    
    return 0;
}

