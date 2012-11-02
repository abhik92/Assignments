# include<iostream>
# include<stdio.h>
# include<string.h>
# include<math.h>
using namespace std;
int main()
{
        int var,t,n;
        scanf("%d",&t);
        //printf("%d\n",floor(1));
        for(var=0;var<t;var++)
        {
                scanf("%d",&n);
                int i,j;
                long long int ans,ar[n+2];
                for(i=1;i<=n;i++)
                {
                        scanf("%lld",&ar[i]);
                }
                ans = ar[1]; long long int excess = 0;
                for(i=2;i<=n;i++)
                {
                        /*while(ar[i] < ans)
                        {
                             ar[i]+= i-1;
                             ans--;   
                        
                        }*/
                        if(ar[i] < ans)
                        {
                                j = ans - ar[i];
                                double k  = (double)j/i;
                                //printf("k = %f   ",k);
                                j = ceil(k);
                                //printf("%d   %d\n",i,j);       
                                ar[i] = ar[i] + (j* (i-1));
                                ans = ans - j;
                        
                        }
                        if(ar[i] > ans)
                        {
                                ar[i+1] += ar[i] - ans;
                        }
                
                }
                printf("%lld\n",ans);
 
 
 
        }
return 0;
}        
