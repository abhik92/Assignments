# include<iostream>
# include<stdio.h>
# include<assert.h>
using namespace std;
int tree[640001],flag[640001],maxint=320001;                //max value in an interval

//let the flag value be what the parent was update with
void build(int node,int b,int e)
{
        if(b>e)
        return;
        else if(b==e)
        {
                tree[node] = 0;
                return;
        }
        build(2*node,b,(b+e)/2);
        build(2*node + 1,(b+e)/2 + 1,e);
        
                tree[node] = tree[2*node + 1] + tree[2*node];
        
        return;

}

int query(int node,int b,int e,int i,int j)
{
        //assert(node<maxint);
        if(node>maxint)
        {
                return 0;
        }
        if(b>e || e<i || b>j)
        {
                return 0;                              //assuming -1 is not possible in array values
        }
        else if( b>=i && e<=j)
        {
                if(flag[node]%2)
                {
                        
                        int temp1,temp2,p1,p2;
                        temp1= 2*node;
                        temp2 = temp1+1;
                        flag[temp1]++;  // = flag[node];
                        flag[temp2]++;  // = flag[node];
                        
                        //pushed update flags to its roots
                        // then update this node
                        tree[node] = e-b+1 - tree[node];
                        flag[node ] = 0;
                }
                return tree[node];
        }
        
        int temp1,temp2,p1,p2;
        temp1= 2*node;
        temp2 = temp1+1;
        
        
        //pushed update flags to its roots
        // then update this node
        if(flag[node]%2)
        {
        flag[temp1]++;// = flag[node];
        flag[temp2]++;// = flag[node];
        tree[node] = e-b+1 - tree[node];
        flag[node ] = 0;
        }
        p1 = query(temp1,b,(b+e)/2,i,j);
        p2 = query(temp2, (b+e)/2 + 1,e,i,j);
        
                //tree[node] = p1 + p2;
                return p2 + p1;
        


}

void update(int node,int b,int e,int i,int j,int val)
{
        //assert(node<maxint);
        if(node>maxint)
        {
                return;
        }
        //printf("%d   %d\n",b,e);
        if(b>e)
        {
                return ;
        }
        else if(e<i || b>j)
        {
                int temp1,temp2,p1,p2;
                temp1= 2*node;
                temp2 = temp1+1;
                if(flag[node]%2)
                {
                        tree[node] = e-b+1-tree[node];
                        flag[temp1] += 1;
                        flag[temp2] += 1;
                        flag[node] = 0;
                }
                return;                              //assuming -1 is not possible in array values
        }
        else if( b>=i && e<=j)
        {
                if(flag[node]%2)          //its already flagged so pushed once. before and now again pushed so no change
                {
                        flag[node] = 0;
                }
                else
                {
                        tree[node]= e-b+1-tree[node];
                }
                //flag its children for update
                flag[2*node]++;
                flag[2*node + 1]++;
                return;
        }
        else
        {
        int temp1,temp2,p1,p2,o1,o2;
        temp1= 2*node;
        temp2 = temp1+1;
        o1 = tree[temp1];
        o2 = tree[temp2];
        update(temp1,b,(b+e)/2,i,j,val);
        update(temp2, (b+e)/2 + 1,e,i,j,val);
        p1 = tree[temp1];
        p2 = tree[temp2];
        
        tree[node] = p1 + p2;
        
       
       } 


}


int main()
{
        //tree[] stores number of bulbs on
        
        int n,i,j,k,b,e,val,m,s;
        scanf("%d %d",&n,&m);
        for(i=0;i<=640000;i++)
        {
                flag[i] = 0;
                tree[i] = 0;
        }
        //build(1,0,n-1);
        
        /*
        printf("%d\n",query(1,0,n-1,2,7));
        update(1,0,n-1,4,6,10);
        printf("%d\n",query(1,0,n-1,2,7));
        */
        for(i=0;i<m;i++)
        {
                scanf("%d %d %d",&j,&s,&k);
                if(j)           //count
                {
                        printf("%d\n",query(1,0,n-1,s,k));
                }
                else            //update
                {
                        update(1,0,n-1,s,k,1);
                }
                /*for(j=1;j<=7;j++)
                {
                        printf(" %d    %d   %d\n",j,tree[j],flag[j]);
                }*/
        }






return 0;
}
