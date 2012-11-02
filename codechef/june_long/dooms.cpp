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
    int t;
    inp_d(t);

    while(t--)
    {
        int k;
        inp_d(k);

        char s[1000];
        char g[1000];
        
        inp_s(s);
        strcpy(g,s);

        int len = strlen(s);
        bool correct = true;

        if(k==1 && len>1)
        {
            out_s("NO\n");
            continue;
        }
        
        else if(k==2 && len == 1)
        {
            if(s[0] == '?') out_s("0");
            else out_s(s);
            
            out_nl();
            continue;
        }
        else if(k==2 && len%2!=0)
        {
            out_s("NO\n");
            continue;
        }
        
        else if(k==2 && len%2==0)
        {
           char rr = '0';
           int i;
           for(i=0;i<strlen(s);i++)
           {
                if(s[i] !='?')
                {
                    if(s[i]!=rr)
                        break;
                }
                else
                    s[i] = rr;
                
                if(rr == '0')rr = '1';
                else rr = '0';
           }
           
           if(i!=strlen(s))
            {
                rr = '1';
                strcpy(s,g);
                
                for(i=0;i<strlen(s);i++)
                {
                    if(s[i] !='?')
                    {
                        if(s[i]!=rr)
                            break;
                    }
                    else
                        s[i] = rr;

                    if(rr == '0')rr = '1';
                    else rr = '0';
                }
            }
            
            if(i!=strlen(s))
                out_s("NO\n");
            else
            {
                out_s(s);
                out_nl();
            }

            continue;
        }

        //For k>2
        int i,j;
        for(i=0;i<len;i++)
        {
            if(s[i] == '?')
            {
                for(j=0;j<k;j++)
                {
                   if(i==0)
                   {    
                        if(j!=s[len-1]-'0' && j!=s[i+1]-'0')
                        {
                            s[i] = j+'0';
                            break;
                        }
                   }
                   else if(i==len-1)
                   {
                        if(j!=s[i-1]-'0' && j!=s[0]-'0')
                        {    s[i] = j+'0';
                             break;
                        }
                   }
                   else
                   {
                        if(j!=s[i-1]-'0' && j!=s[i+1]-'0')
                        {
                            s[i] = j+'0';
                            break;
                        }
                   }
 
 
                }
            }
        }
       
        for(i=0;i<len;i++)
        {
            if(i==0)
            {
                if((s[i] == s[len-1]&&i!=len-1) || (s[i] == s[i+1]))
                {
                    correct = false;
                    break;
                }
            }
            else if(i == len-1)
            {
                if((s[i] == s[i-1]) || (s[i] == s[0] && i!=0))
                {
                    correct = false;
                    break;
                }
            }
            else
            {
                if((s[i] == s[i-1]) || (s[i] == s[i+1]))
                {
                    correct = false;
                    break;
                }
            }
        }
        
        if(!correct)
            out_s("NO");
        
        else
            out_s(s);
        

        out_nl();
 
 
    }
    
 
    return 0;
}
