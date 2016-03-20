# INSTRUCTIONS:
#
# Install Coffeescript:
# 		npm install -g coffee-script
#
# Run from the terminal:
# 		coffee wordsAndEmoticons.coffee 'Write here any string you want. :)'

if process.argv[2]?
	input = process.argv[2]
else
	input = "(: When input is missing, this string will have to do. :P"


listWords = (str) ->

	console.log 'Original string: "' + str + '"'

	words = filterWords(str, 'word')
	emoticons = filterWords(str, 'emoticon')

	# Iterates the words and lists them
	console.log '\nWords:'
	for i of words
		if count?
			count = count + 1
		else count = 1

		console.log count + ': ' + words[i]

	# Emoticons seperately
	console.log '\nEmoticons:'
	for i of emoticons
		if amount?
			amount = amount + 1
		else amount = 1

		console.log amount + ': ' + emoticons[i]

filterWords = (str, type) ->

	# Finds typical empticons, such as :P and [:
	if type is 'emoticon'
		regex = /([\(\)\[\]DPO]?[:;=][\(\)\[\]DPO]?)/gi
		result = str.match(regex)

	# Finds words, also in Finnish
	else if type is 'word'
		regex = /([A-Za-z\u00C4\u00E4\u00D6\u00F6]+)/g
		result = str.match(regex)

	return result

listWords input
