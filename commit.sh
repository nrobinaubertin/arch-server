git rm $(git ls-files --deleted)
git add *
d=`date`
git commit -m "$d" 
git pull
git push
