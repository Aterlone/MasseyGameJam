Only do this the first time
```
git clone https://github.com/VuwCTF/VuwGCTF.git
```

From there on, each time you start 
```
git checkout main
git pull
```
When you are implementing a feature 
```
git checkout -b youruser-feature
```

This will create a new branch where you can work on your feature.
As you are creating it, each important change run this on files you want to add
```
git add
```

then 
```
git commit -m "Useful Message"
```

When you think you are done implementing
``
git push origin youruser-feature
```

Then if you don't need this feature for what you are doing next or nobody is there to merge your feature.
```
git checkout main
git pull
```
and start fresh, otherwise don't run this.

When you start on your new feature start again from,
```
git checkout -b youruser-feature
```
This includes if you are not starting fresh, as in this case, you will be branching off of the changes you have made.
