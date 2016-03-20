# INSTRUCTIONS:
#
# Install Coffeescript:
# 		npm install -g coffee-script
#
# Run from the terminal:
# 		coffee siteStatus.coffee http://xyzzy.com 20 2
#
# The first number defines how many times you want to make the request
# The second number defines the interval between requests (in seconds)
# Both are optional


http = require 'http'


if process.argv[2]?

	# Tests the URL's spelling just in case
	regex = /((http|https):\/\/)(www\.)?(.+)(\.\w+)\/?(\w+)?/g
	par = process.argv[2]
	if par.match(regex)
		url = par
	else
		console.log "Check the URL spelling!"
		return
else
	url = 'http://xyzzy.com/'

# Request amount (defaut is 10)
if process.argv[3]?
	repeat = process.argv[3]
else
	repeat = 10

# Request interval (default is 2 seconds)
if process.argv[4]?
	interval = process.argv[4] * 1000
else
	interval = 2000

request = ->

	# Takes the starting time for the request
	startTime = new Date().getTime()

	req = http.get url, (res) ->

		# If status is 200, prints OK, else fail and the status code
		status = res.statusCode
		if status is 200
			requestTime = new Date().getTime() - startTime
			process.stdout.write timestamp() + " OK! " + "(" + requestTime + "ms)\n"
			res.on 'data', (data) ->
				body = data.toString()
			repeat--
		else
			requestTime = new Date().getTime() - startTime
			process.stdout.write timestamp() + " Fail! " + "[" + status + "] " + "(" + requestTime + "ms)\n"
			repeat--

		# Then the request has been repeated the specified times, stops the timer
		if repeat < 1
			console.log "Loppu!"
			clearInterval(Timer)
			return

	# If something goes wrong, print the error message
	req.on 'error', (e) ->
		console.log e.message
		return

# Turns the timestamp into a readable form
# TODO Insert a zero before the single numbers
timestamp =  ->
	now = new Date()
	h = now.getHours()
	m = now.getMinutes()
	s = now.getSeconds()
	return h + ":" + m + ":" + s

# Creates a timer
Timer = setInterval request, interval