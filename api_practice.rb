require "http"

response = HTTP.get("https://deckofcardsapi.com/api/deck/new/draw/?count=2")
pp response.parse
