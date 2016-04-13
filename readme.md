# Utility scripts

Here I'll store my misc scripts for personal or educational use, typically written in CoffeeScript.

Install CoffeeScript:

```
npm install -g coffee-script
```


## wordsAndEmoticons.coffee

Takes a string as a parameter and lists all the words and emoticons seperately.

Run from the terminal:

```coffee
coffee wordsAndEmoticons.coffee 'Write here any string you want. :)'
```


## mostCommonWords.coffee

Takes a text file as a parameter and finds and lists the 5 most most common words in it.

Run from the terminal:

```coffee
coffee mostCommonWords.coffee ./file.txt
```

**TODO**

- [ ] Change countedWords to an object for faster iterating (takes ages right now for long files)

## siteStatus.coffee

Checks a website's status. The first number parameter defines the request count and the second defines the interval between requests (in seconds).

Run from the terminal:

```coffee
coffee siteStatus.coffee http://xyzzy.com 20 2
```

**TODO**

+ [ ] HTTPS
+ [ ] Account for other statuses than 200 (like redirect)

## taija.coffee

A demonstrative emulation script of my life and my chances.

```coffee
coffee taija.coffee
```
