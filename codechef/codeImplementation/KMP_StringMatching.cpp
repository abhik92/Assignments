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

vector<int> listOfMatchPositions;
set<int> uniquePositions;

void FailureFunction(char P[], int F[],int m){
	int i,j;
	F[0]=0;	//  assignment is important!
	j=0;
	i=1;
	while(i<m){ // that i is less than the length of pattern
		if(P[i]==P[j]){
			F[i]=j+1;
			i++;
			j++;
		}else if(j>0){
			j=F[j-1];
		}else {
			F[i]=0;
			i++;
		}
	}
}

bool KMP(char T[], char P[]){
	int i,j,F[MAX];	// the maximum size of Pattern String
	int m=strlen(P);
	int n=strlen(T);
	FailureFunction(P,F,m);
	
    i=0;
	j=0;

    bool matchFound = false;
	while(i<n){
		if(T[i]==P[j]){
			if(j==m-1)
            {
                matchFound = true;
                if(uniquePositions.count(i-j)==0)
                {
                    listOfMatchPositions.pb(i-j); // means, in (i-j)th position, there is a match occur
                    uniquePositions.insert(i-j);
                }
                while(T[i] == P[j])
                {
                    i++;
                    j++;
                }

            }
			else{
				i++;
				j++;
			}
		}else if(j>0){
			j=F[j-1];
		}else{
			i++;
		}
	}
	return matchFound; // No match found
}


int main()
{
	char T[2005][2005],P[305][305];
    
    inp_s(T);
    inp_s(P);

    KMP(T,P);

    int i;
    for(i=0;i<v_size(listOfMatchPositions);i++)
        out_d(listOfMatchPositions[i]);
    
			
return 0;
}

