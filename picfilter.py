#!/usr/bin/env python
import os

def main():
    a = fclean()
    a.walk()

class fclean(object):
    whiteprefix = ["p_large"
            ,"large"
            ]
    blackprefix = ["qw_cat"
            ,"small"
            ,"user"
            ,"User"
            ,"avatar"
            ,"tieba_index"
            ,"ali_"
            ,"file_"
            ,"common_"
            ]
    blackend = ['.js'
            ,'.css'
            ,'.php'
            ,'.db'
            ,'.swf'
            ,'.htm'
            ,'.html'
            ]


    def black(this, f):
        for i in this.blackprefix:
            if f[:len(i)] == i :
                return 1
        for i in this.blackend:
            if f[0-len(i):] == i :
                return 1
        return 0


    def white(this, f):
        for i in this.whiteprefix:
            if f[:len(i)] == i :
                return 1
        return 0


    def deletefile(this,d,f):
        fname = d + "/" + f
        os.remove(fname)
        return 0


    def processone(this,d,f):
        if this.white(f) :
            return
        if this.black(f) :
            this.deletefile(d,f)
            return
        loc = f.rfind(".")
        if loc == -1 :
            this.deletefile(d,f)
            return
        end = f[loc:]
        if end != ".jpg" and end != ".jpeg" and end != ".png" and end!= ".gif":
            return
        fsize = os.path.getsize(d+'/'+f)
        if fsize <= 15000:
            this.deletefile(d,f)
            print f,fsize


    def walk(this):
        path="./Pictures"
        for i in os.walk(path):
            for j in i[2]:
                this.processone(i[0],j)


if __name__ == "__main__":
    main()
