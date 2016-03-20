# INSTRUCTIONS:
#
# Install Coffeescript:
# 		npm install -g coffee-script
#
# Run from the terminal:
# 		coffee mostCommonWords.coffee ./file.txt


fs = require 'fs'

getWords = (string) ->

	# Finds words and turns them into lower case
	regex = /([A-Za-z\u00C4\u00E4\u00D6\u00F6]+)/gi
	string = string.replace(regex, toLowerCase)
	words = string.match(regex)

	sortedWords = []
	countedWords = []

	# TODO Change countedWords to an object for faster iterating!

	# Iterates all the words
	for i of words
		word = words[i]
		index = words.indexOf(word)
		indices = []

		# Counts the word occurence according to the indices
		while index != -1
			indices.push index
			index = words.indexOf(word, index + 1)

		unless word in countedWords
			# Discounts words that have already been counted
			sortedWords.push [indices.length, word]
		countedWords.push word

	# Sorts words acording to the number of occurence
	sortedWords.sort(sortWords).reverse()

	#console.log sortedWords

	# Let's take only the 5 most common words
	commonWords = sortedWords.slice(0,5)
	mostCommon(commonWords)

mostCommon = (sortedWords) ->

	# Let's then list the words in a pretty format in the console
	for i of sortedWords
		count = sortedWords.indexOf(sortedWords[i]) + 1
		word = sortedWords[i][1]
		amount = sortedWords[i][0]
		console.log count + ". The word '" + word + "' occurs " + amount + ' times'

toLowerCase = (string) ->
	# Turns all words to lower case
	return string.toLowerCase()

sortWords = (a, b) ->

	# Properly sort the word amounts
	if a < b
		return -1
	else if a > b
		return +1
	else
		return 0

# Takes an argument and tests the path spelling just in case
if process.argv[2]?

	# Recognizes Windows and Linux file paths
	regex = /^(\.\/|\.\.\/|\/|\.?\\?\\|[A-Z]:\\)(\.?\w+(\/|\\))*(.+\.\w+)$/g
	par = process.argv[2]
	if par.match(regex)
		filePath = par
		# Opens a file and turns it into a stirng
		fs.readFile filePath, (err, data) ->
			if err then throw err
			data = data.toString()
			getWords data
	else
		console.log "Check the spelling of the file path."

else
	console.log "The file path is missing!\n\nType:"
	console.log "$ coffee mostCommonWords.coffee ./file.txt"

