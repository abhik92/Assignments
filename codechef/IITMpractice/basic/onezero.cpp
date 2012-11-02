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

struct node
{
    char num[35];
    int rem;


};


int main()
{
    int k;
    inp_d(k);

    while(k--)
    {
        int n;
        inp_d(n);
        
        bool visited[20005];
        int i;
        for(i=0;i<n;i++)
            visited[i] = false;

        queue<node> remainders;
        node temp;
        strcpy(temp.num,"1");
        
        temp.rem =  1%n;
        remainders.push(temp);
        visited[temp.rem] = true; 
                
        while(!remainders.empty())
        {
            node front = remainders.front();
            remainders.pop();
            if(front.rem == 0)
            {
                cout<<(front.num);
                out_nl();
                break;

            }
             

        
            int newrem = (front.rem*10)%n;
            if(!visited[newrem])
            {
                visited[newrem] = true;
                temp.rem = newrem;
                strcpy(temp.num , front.num);
                strcat(temp.num,"0");
                remainders.push(temp);
            }

            newrem = (front.rem*10+1)%n;

            if(!visited[newrem])
            {
                visited[newrem] = true;
                temp.rem = newrem;
                strcpy(temp.num , front.num);
                strcat(temp.num,"1");
                remainders.push(temp);

            }
        }
    }    




return 0;
}

