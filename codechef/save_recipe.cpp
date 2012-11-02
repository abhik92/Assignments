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
 

int main()
{
    int n;
    inp_d(n);
    
    char rec[1005][1005];
    long long int pri[1005];

    int i;
    for(i=0;i<n;i++)
    {
        inp_s(rec[i]);
        inp_lld(pri[i]);


    }

    int q;
    inp_d(q);

    for(i=0;i<q;i++)
    {
        char sss[1005];
        inp_s(sss);
        int j;
        long long int cur_priorit = 1000000001* (-1);
        char ans[1005];
        strcpy(ans,"NO");
        for(j=0;j<n;j++)
        {
               int k;
               for(k=0;k<strlen(sss);k++)
               {    
                    if(sss[k] != rec[j][k])
                        break;

               }
               if(k == strlen(sss) && pri[j]>cur_priorit)
                {
                    strcpy(ans,rec[j]);
                    cur_priorit = pri[j];
        
                }

        }
        printf("%s\n",ans);

    }

    return 0;
}


