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
    int x;
    int y;
    int num_steps;
    int rkey;
    int gkey;
    int ykey;
    int bkey;

};
bool visited[105][105][3][3][3][3];
node update(int x,int yy,int num_steps,int r,int g,int y,int b)
{
    node temp;

    temp.x = x;
    temp.y = yy;
    temp.num_steps = num_steps;
    temp.rkey = r;
    temp.gkey = g;
    temp.ykey = y;
    temp.bkey = b;
    
    visited[x][yy][r][g][y][b] = true;
    return temp;



}

int main()
{
    
    while(true){
    int r,c;
    inp_d(r);
    inp_d(c);
    
    if(r==0 && c==0)
        break;
    char grid[105][105];
    int i,j;
    int posx = 0,posy = 0;
    for(i=0;i<r;i++)
    {
        for(j=0;j<c;j++)
        {
            scanf("\n%c",&grid[i][j]);
            if(grid[i][j] == '*')
            {
                posx= i;
                posy = j;

            }
        }

    }
    
    int rr,gg,yy,bb;
    for(i=0;i<r;i++)
    {
        for(j=0;j<c;j++)
        {
            for(rr = 0;rr<2;rr++)
            {
                for(gg=0;gg<2;gg++)
                {
                    for(yy=0;yy<2;yy++)
                    {
                        for(bb = 0;bb<2;bb++)
                            visited[i][j][rr][yy][gg][bb] = false;


                    }


                }


            }



        }



    }

    queue<node> bfs;
    node temp;
    temp.num_steps = 0;
    temp.x = posx;
    temp.y = posy;
    temp.rkey = 0;
    temp.bkey = 0;
    temp.gkey = 0;
    temp.ykey = 0;
    visited[posx][posy][0][0][0][0] = true;
    bfs.push(temp);
    int min = INF;
    bool br = false;
    while(!bfs.empty())
    {
        node top = bfs.front();
        bfs.pop();
        
        int lx = top.x;
        int ly = top.y;
        int num_steps = top.num_steps;
        int lr = top.rkey;
        int lg = top.gkey;
        int lyel = top.ykey;
        int lb = top.bkey;
        
        if(br)
        {
            if(num_steps>min)
                break;

        }
        if(grid[lx][ly] == 'X')
        {
            min = num_steps;
            br = true;

        }

        node temp;
        if(lx+1<r)
        {
            if(!visited[lx+1][ly][lr][lg][lyel][lb])
            {
                switch(grid[lx+1][ly])
                {
                    case 'r': temp = update(lx+1,ly,num_steps+1,1,lg,lyel,lb);bfs.push(temp);break;
                    case 'g': temp = update(lx+1,ly,num_steps+1,lr,1,lyel,lb);bfs.push(temp);break;
                    case 'y': temp = update(lx+1,ly,num_steps+1,lr,lg,1,lb);bfs.push(temp);break;
                    case 'b': temp = update(lx+1,ly,num_steps+1,lr,lg,lyel,1);bfs.push(temp);break;
                    case '.': case '*':case 'X':temp = update(lx+1,ly,num_steps+1,lr,lg,lyel,lb);bfs.push(temp);break;
                    case 'R':if(lr == 1){temp = update(lx+1,ly,num_steps+1,lr,lg,lyel,lb);bfs.push(temp);}break;
                    case 'G':if(lg == 1){temp = update(lx+1,ly,num_steps+1,lr,lg,lyel,lb);bfs.push(temp);}break;
                    case 'Y':if(lyel == 1){temp = update(lx+1,ly,num_steps+1,lr,lg,lyel,lb);bfs.push(temp);}break;
                    case 'B':if(lb == 1){temp = update(lx+1,ly,num_steps+1,lr,lg,lyel,lb);bfs.push(temp);}break;
                    default:break;

                }
            }



        }
        if(lx-1>=0)
        {
            if(!visited[lx-1][ly][lr][lg][lyel][lb])
            {
                switch(grid[lx-1][ly])
                {
                    case 'r': temp = update(lx-1,ly,num_steps+1,1,lg,lyel,lb);bfs.push(temp);break;
                    case 'g': temp = update(lx-1,ly,num_steps+1,lr,1,lyel,lb);bfs.push(temp);break;
                    case 'y': temp = update(lx-1,ly,num_steps+1,lr,lg,1,lb);bfs.push(temp);break;
                    case 'b': temp = update(lx-1,ly,num_steps+1,lr,lg,lyel,1);bfs.push(temp);break;
                    case '.': case '*':case 'X':temp = update(lx-1,ly,num_steps+1,lr,lg,lyel,lb);bfs.push(temp);break;
                    case 'R':if(lr == 1){temp = update(lx-1,ly,num_steps+1,lr,lg,lyel,lb);bfs.push(temp);}break;
                    case 'G':if(lg == 1){temp = update(lx-1,ly,num_steps+1,lr,lg,lyel,lb);bfs.push(temp);}break;
                    case 'Y':if(lyel == 1){temp = update(lx-1,ly,num_steps+1,lr,lg,lyel,lb);bfs.push(temp);}break;
                    case 'B':if(lb == 1){temp = update(lx-1,ly,num_steps+1,lr,lg,lyel,lb);bfs.push(temp);}break;
                    default:break;

                }
            }




        }
        if(ly+1<c)
        {
            if(!visited[lx][ly+1][lr][lg][lyel][lb])
            {
                switch(grid[lx][ly+1])
                {
                    case 'r': temp = update(lx,ly+1,num_steps+1,1,lg,lyel,lb);bfs.push(temp);break;
                    case 'g': temp = update(lx,ly+1,num_steps+1,lr,1,lyel,lb);bfs.push(temp);break;
                    case 'y': temp = update(lx,ly+1,num_steps+1,lr,lg,1,lb);bfs.push(temp);break;
                    case 'b': temp = update(lx,ly+1,num_steps+1,lr,lg,lyel,1);bfs.push(temp);break;
                    case '.': case '*':case 'X':temp = update(lx,ly+1,num_steps+1,lr,lg,lyel,lb);bfs.push(temp);break;
                    case 'R':if(lr == 1){temp = update(lx,ly+1,num_steps+1,lr,lg,lyel,lb);bfs.push(temp);}break;
                    case 'G':if(lg == 1){temp = update(lx,ly+1,num_steps+1,lr,lg,lyel,lb);bfs.push(temp);}break;
                    case 'Y':if(lyel == 1){temp = update(lx,ly+1,num_steps+1,lr,lg,lyel,lb);bfs.push(temp);}break;
                    case 'B':if(lb == 1){temp = update(lx,ly+1,num_steps+1,lr,lg,lyel,lb);bfs.push(temp);}break;
                    default:break;

                }
            }




        }
        if(ly-1>=0)
        {
            if(!visited[lx][ly-1][lr][lg][lyel][lb])
            {
                switch(grid[lx][ly-1])
                {
                    case 'r': temp = update(lx,ly-1,num_steps+1,1,lg,lyel,lb);bfs.push(temp);break;
                    case 'g': temp = update(lx,ly-1,num_steps+1,lr,1,lyel,lb);bfs.push(temp);break;
                    case 'y': temp = update(lx,ly-1,num_steps+1,lr,lg,1,lb);bfs.push(temp);break;
                    case 'b': temp = update(lx,ly-1,num_steps+1,lr,lg,lyel,1);bfs.push(temp);break;
                    case '.': case '*':case 'X':temp = update(lx,ly-1,num_steps+1,lr,lg,lyel,lb);bfs.push(temp);break;
                    case 'R':if(lr == 1){temp = update(lx,ly-1,num_steps+1,lr,lg,lyel,lb);bfs.push(temp);}break;
                    case 'G':if(lg == 1){temp = update(lx,ly-1,num_steps+1,lr,lg,lyel,lb);bfs.push(temp);}break;
                    case 'Y':if(lyel == 1){temp = update(lx,ly-1,num_steps+1,lr,lg,lyel,lb);bfs.push(temp);}break;
                    case 'B':if(lb == 1){temp = update(lx,ly-1,num_steps+1,lr,lg,lyel,lb);bfs.push(temp);}break;
                    default:break;

                }
            }


        }



    }
    if(br)
        printf("Escape possible in %d steps.",min);
    else
        out_s("The poor student is trapped!");
    out_nl();
    }
return 0;
}

