
library(usethis)
edit_git_config()
use_github()

library(a)
library(b)
library(c)


#两个文件不能同时更新，如果本地和远程文件都更新了
#需要先将本地文件git add 然后 git commit，再git push完成后
#在使用git pull从远程拷贝下载文件