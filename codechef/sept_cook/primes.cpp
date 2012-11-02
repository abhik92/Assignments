/* B.SAIKRISHNA
 * 22.7.2012
 * CIEL AND RECEIPT
 * JULY COOK OFF PROBLEM ON CODECHEF
 */
# include<stdio.h>
# include<stdlib.h>
# include<string.h>
# include<iostream>
# include<algorithm>
# include<math.h>
using namespace std;
long long int ar[5000001],mod = 1000000007;
bool primes[5000001];
int main()
{
        long long int n,t,var,m,p,l,q,ans=0,temp,sum,maxi,i,j,MAX = 5000001;
        scanf("%lld",&t);
        ar[1] = 1;
        ar[2] = 2;
        ar[3] = 6;
        ar[4] = 18;
       
       for(i=0;i<MAX;i++) 
       primes[i] = 1; 
       
       for(i=2;i<=(int)sqrt(MAX);i++) 
         {
         if (primes[i]) 
         {
           for(j=i;j*i<MAX;j++) 
           {    primes[i*j] = 0; 
                }
         }
         }        
        long long pnum = 3;           //i.e num-primes < 5 are 1,2,3;
        
        for(i=5;i<MAX;i++)
        {
                if(primes[i])
                {
                        pnum++;
                }
                ar[i] = (ar[i-1]*pnum)%mod;
                
        
        }
        for(var=0;var<t;var++)
        {   
                scanf("%lld",&n);
                printf("%lld\n",ar[n]);
        }




return 0;
}        
