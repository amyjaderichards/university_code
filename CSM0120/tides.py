#!/usr/bin/env python3


import matplotlib.pyplot as plt
import csv
import datetime as dt

def get_data_from_file(filename, dates, heights):
    format = "%Y-%m-%d %I:%M %p %Z"
    f = open(filename, 'r')
    csvreader = csv.reader(f)
    
    for row in csvreader:
        thedate = row[1]
        thetime = row[2]
        theheight = row[3]
        hi_lo = row[4]
        
        if hi_lo.startswith("High"):
            fulldate = thedate + " " + thetime
            dates.append(dt.datetime.strptime(fulldate, format))
            
            heights.append(float(theheight[:-2])) #Gets rid of last two characters ' m'
    
    print("getting data")
    
    
def plot_data(dates, heights):
    # do something
    print("plotting some stuff")
    plt.plot(dates, heights)
    plt.gcf().autofmt_xdate() #AUTO FORMATS THE DATE ***
    
def main():
    print("tide processing")
    filename = "tides.csv"
    dates = []
    heights = []
    get_data_from_file(filename, dates, heights)
    plot_data(dates, heights)

if __name__ == "__main__":
    main()