import string
import random
import sys,os
import datetime
import MySQLdb
from random import randint
from datetime import datetime
import random

def random_date():
    start_date = datetime.now().replace(day=1, month=1).toordinal()
    end_date = datetime.now().toordinal()
    random_day = datetime.fromordinal(random.randint(start_date, end_date))
    return random_day

f = open("/home/karthikabinav/fifthsem/Assignments/Database/coords.csv")

count = 1


def random_with_N_digits(n):
    range_start = 10**(n-1)
    range_end = (10**n)-1
    return randint(range_start, range_end)

"""
def insert(line):
    [id_,name,dept,q] = line.split(',', 4)
    db = MySQLdb.connect("localhost","root","abc","DBProject" )
    cursor = db.cursor()

    visitor = str(random_with_N_digits(2))
    event = str(randint(1,62))
    
    sql = "update table subdepartment set equipment_id= (" + visitor  + ")"
    print sql
    
    cursor.execute(sql)
    db.commit()
    db.close()

for line in f:
    insert(line)
    count = count + 1
    if(count == 63):
        break;
"""
def insert(line):
    [id_,name,dept,q] = line.split(',', 4)
    db = MySQLdb.connect("localhost","root","abc","DBProject" )
    db1 = MySQLdb.connect("localhost","root","abc","DBProject" )
    
    cursor = db.cursor()
    cursor1 = db1.cursor()

    sql = "select cost from equipment where name='carpets'"
    cursor.execute(sql)
    
    data=cursor.fetchone()
    cost = data[0]
    cost = cost+1

    sql = "update equipment set cost="+str(cost)+" where name='carpets'"
    cursor.execute(sql)
    
    sql1 = "select cost from equipment where name='carpets'"
    cursor1.execute(sql1)
    print cursor1.fetchone()

    db.commit()
    db1.commit()
    
    db.rollback()
    db.close()
    db1.close()

for line in f:
    insert(line)
    break;

