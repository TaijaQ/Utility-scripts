
taija =
  age: 23
  gender: 'female'
  state: 'unemployed'
  dream: false
  workingHard: true

freakout = ->
  for num in [10...0]
    console.log num + " - Breathe...."
  console.log "Now what?"

luckyDay = (age) ->
  taija.dream = true
  taija.state = "employed"
  happenstance = ["Someone believed in me", "Got a chance to shine", "Found a way to make it happen"]
  console.log "At age " + age + " my dream came true because" + happenstance[0]
  freakout()

crazyLuck = (max, min=0) ->
  return Math.floor(Math.random() * (max - min) + min)

doSomething = (day) ->
    if typeof day == 'number'
      if crazyLuck(100) == 29
        console.log "What happened?"
        luckyDay(taija.age)
      else
        console.log "Fake it till you make it! :)"

daysInAYear = [1...365]
day = 1

while taija.dream == false
  for day in daysInAYear
    day = day + 1
    if day == 365
       taija.age = taija.age + 1
       console.log "Taija is now " + taija.age + " old!"
       doSomething(day)
