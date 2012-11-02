
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
#define INF 10000

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
    int x;
    int y;
    int num_steps;

};
bool visited[105][105][120];
node update(int x,int y,int num_steps,int d)
{
    node temp;

    temp.x = x;
    temp.y = y;
    temp.num_steps = num_steps;
    temp.high = 0;
    temp.low = INF;
    
    visited[x][y][d] = true;
    return temp;



}

int main()
{
    
    int n;
    inp_d(n);
    
    int grid[105][105];
    int i,j;
    
    for(i=0;i<n;i++)
    {
        for(j=0;j<n;j++)
        {
            scanf("%d",&grid[i][j]);
        }

    }
    
    int dd;
    for(i=0;i<n;i++)
    {
        for(j=0;j<n;j++)
        {
            for(dd = 0;dd<=114;dd++)
                visited[i][j][dd] = false;
        }
    }

    queue<node> bfs;
    node temp;
    temp.num_steps = 0;
    temp.x = 0;
    temp.y = 0;
    
   visited[0][0][0] = true;
    bfs.push(temp);
    
    int mini = INF;
    while(!bfs.empty())
    {
        node top = bfs.front();
        bfs.pop();
        
        int lx = top.x;
        int ly = top.y;
        int num_steps = top.num_steps;
        int ld;
        
        int lmin,;max;
        if(lx == n-1 && ly == n-1)
        {
            mini = min(mini,num_steps);
        }
        
        node temp;
        if(lx+1<n)
        {

            lmin = min(grid[lx+1][ly],top.low);
            lmax = max(grid[lx+1][ly],top.high);
            ld = abs(lmax-lmin);
            if(!visited[lx+1][ly][num_steps])
            {
               temp = update(lx+1,ly,ld,num_steps);
               bfs.push(temp);
            }



        }
        if(lx-1>=0)
        {
            ld = abs(grid[lx-1][ly]-grid[lx][ly]);
            if(!visited[lx-1][ly][num_steps])
            {

                temp = update(lx-1,ly,max(num_steps,ld),num_steps);
                bfs.push(temp);

                
            }




        }
        if(ly+1<n)
        {
             ld = abs(grid[lx][ly+1]-grid[lx][ly]);
            if(!visited[lx][ly+1][num_steps])
            {
                temp = update(lx,ly+1,max(num_steps,ld),num_steps);
                bfs.push(temp);

            }




        }
        if(ly-1>=0)
        {
            ld = abs(grid[lx][ly-1]-grid[lx][ly]);
            if(!visited[lx][ly-1][num_steps])
            {
                temp = update(lx,ly-1,max(num_steps,ld),num_steps);
                bfs.push(temp);

                
            }


        }



    }
    out_d(mini);
    out_nl();
return 0;
}

