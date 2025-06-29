# 📋 Tatiana Bot 2.0 - Commands Reference

## 🎯 Command Overview

Tatiana Bot 2.0 supports both **slash commands** (`/command`) and **prefix commands** (`!command` - customizable). All commands include detailed help information and argument validation.

## 🧠 AI & Chat Commands

### `/chat <message>`
**Description**: Start an intelligent conversation with Tatiana using Gemini AI  
**Usage**: `/chat Hello, how are you today?`  
**Permissions**: Everyone  
**Cooldown**: 3 seconds  

**Features:**
- Context-aware responses
- Personality-based interactions
- Multi-language support
- Content filtering

### `/ai_personality <personality>`
**Description**: Set the AI personality for the server (Admin only)  
**Usage**: `/ai_personality friendly`  
**Options**: `friendly`, `professional`, `funny`, `sarcastic`, `wise`  
**Permissions**: Manage Server  
**Cooldown**: 60 seconds

### `/ai_reset`
**Description**: Reset conversation context for yourself  
**Usage**: `/ai_reset`  
**Permissions**: Everyone  
**Cooldown**: 10 seconds

### `/ai_stats`
**Description**: View AI usage statistics  
**Usage**: `/ai_stats`  
**Permissions**: Everyone  
**Cooldown**: 30 seconds

## 🛡️ Moderation Commands

### `/warn <user> [reason]`
**Description**: Issue a warning to a user  
**Usage**: `/warn @user Spamming in chat`  
**Permissions**: Kick Members  
**Cooldown**: 5 seconds

### `/mute <user> <duration> [reason]`
**Description**: Temporarily mute a user  
**Usage**: `/mute @user 1h Inappropriate behavior`  
**Duration Format**: `1m`, `1h`, `1d` (minutes, hours, days)  
**Permissions**: Manage Messages  
**Cooldown**: 3 seconds

### `/kick <user> [reason]`
**Description**: Kick a user from the server  
**Usage**: `/kick @user Breaking server rules`  
**Permissions**: Kick Members  
**Cooldown**: 10 seconds

### `/ban <user> [reason] [delete_days]`
**Description**: Ban a user from the server  
**Usage**: `/ban @user Harassment 7`  
**Permissions**: Ban Members  
**Cooldown**: 15 seconds

### `/unban <user_id>`
**Description**: Unban a user from the server  
**Usage**: `/unban 123456789012345678`  
**Permissions**: Ban Members  
**Cooldown**: 10 seconds

### `/modlogs [user] [limit]`
**Description**: View moderation history  
**Usage**: `/modlogs @user 10`  
**Permissions**: Manage Messages  
**Cooldown**: 5 seconds

### `/automod enable|disable`
**Description**: Toggle AutoMod system  
**Usage**: `/automod enable`  
**Permissions**: Manage Server  
**Cooldown**: 30 seconds

### `/automod config`
**Description**: Configure AutoMod settings  
**Usage**: `/automod config`  
**Permissions**: Manage Server  
**Opens**: Interactive configuration modal

### `/automod_spam_config <threshold> <timeframe>`
**Description**: Configure spam detection  
**Usage**: `/automod_spam_config 5 10`  
**Permissions**: Manage Server  
**Cooldown**: 60 seconds

## 💰 Economy Commands

### `/balance [user]`
**Description**: Check currency balance  
**Usage**: `/balance @user`  
**Permissions**: Everyone  
**Cooldown**: 5 seconds

### `/daily`
**Description**: Collect daily reward  
**Usage**: `/daily`  
**Permissions**: Everyone  
**Cooldown**: 24 hours (per user)

### `/transfer <user> <amount>`
**Description**: Send currency to another user  
**Usage**: `/transfer @user 100`  
**Permissions**: Everyone  
**Cooldown**: 10 seconds  
**Minimum**: 1 coin

### `/leaderboard [type]`
**Description**: View economy leaderboard  
**Usage**: `/leaderboard top`  
**Types**: `top`, `daily`, `weekly`, `monthly`  
**Permissions**: Everyone  
**Cooldown**: 30 seconds

### `/work`
**Description**: Work to earn currency  
**Usage**: `/work`  
**Permissions**: Everyone  
**Cooldown**: 1 hour  
**Earnings**: 50-150 coins (random)

### `/rob <user>`
**Description**: Attempt to rob another user  
**Usage**: `/rob @user`  
**Permissions**: Everyone  
**Cooldown**: 4 hours  
**Success Rate**: 30%  
**Requirements**: Target must have 100+ coins

## 🎰 Gambling Commands

### `/coinflip <amount> <heads|tails>`
**Description**: Flip a coin and bet on the outcome  
**Usage**: `/coinflip 50 heads`  
**Permissions**: Everyone  
**Cooldown**: 10 seconds  
**Minimum Bet**: 10 coins

### `/dice <amount> [target]`
**Description**: Roll dice and win based on the number  
**Usage**: `/dice 100 6`  
**Permissions**: Everyone  
**Cooldown**: 15 seconds  
**Rules**: Roll 6 = 6x payout, Roll 5-6 = 2x payout

### `/slots <amount>`
**Description**: Play the slot machine  
**Usage**: `/slots 75`  
**Permissions**: Everyone  
**Cooldown**: 20 seconds  
**Jackpot**: 1000x bet (0.1% chance)

### `/blackjack <amount>`
**Description**: Play blackjack against the dealer  
**Usage**: `/blackjack 100`  
**Permissions**: Everyone  
**Cooldown**: 30 seconds  
**Interactive**: Hit, Stand, Double Down buttons

### `/lottery buy <tickets>`
**Description**: Buy lottery tickets  
**Usage**: `/lottery buy 5`  
**Cost**: 20 coins per ticket  
**Drawing**: Every Sunday  
**Permissions**: Everyone

### `/lottery info`
**Description**: View current lottery information  
**Usage**: `/lottery info`  
**Shows**: Jackpot amount, tickets sold, time until drawing

## 🐾 Pokémon Commands

### `/pokemon catch`
**Description**: Attempt to catch a spawned Pokémon  
**Usage**: `/pokemon catch`  
**Permissions**: Everyone  
**Cooldown**: 10 seconds  
**Note**: Only works when Pokémon is spawned

### `/pokemon list [user] [page]`
**Description**: View Pokémon collection  
**Usage**: `/pokemon list @user 2`  
**Permissions**: Everyone  
**Cooldown**: 10 seconds  
**Shows**: 10 Pokémon per page

### `/pokemon info <pokemon_id>`
**Description**: View detailed Pokémon information  
**Usage**: `/pokemon info 42`  
**Permissions**: Everyone  
**Shows**: Stats, moves, type, rarity

### `/pokedex [pokemon_name]`
**Description**: View Pokédex information  
**Usage**: `/pokedex Pikachu`  
**Permissions**: Everyone  
**Shows**: Species info, evolution chain, spawn rate

### `/pokemon trade <user> <your_pokemon_id> <their_pokemon_id>`
**Description**: Initiate a Pokémon trade  
**Usage**: `/pokemon trade @user 42 69`  
**Permissions**: Everyone  
**Interactive**: Both users must confirm

### `/pokemon battle <user>`
**Description**: Challenge another user to a Pokémon battle  
**Usage**: `/pokemon battle @user`  
**Permissions**: Everyone  
**Interactive**: Turn-based battle system

### `/pokemon release <pokemon_id>`
**Description**: Release a Pokémon (irreversible)  
**Usage**: `/pokemon release 42`  
**Permissions**: Everyone  
**Confirmation**: Required

### `/pokemon evolve <pokemon_id>`
**Description**: Evolve a Pokémon if requirements are met  
**Usage**: `/pokemon evolve 42`  
**Permissions**: Everyone  
**Requirements**: Level, items, or special conditions

### `/pokemon favorite <pokemon_id>`
**Description**: Mark/unmark Pokémon as favorite  
**Usage**: `/pokemon favorite 42`  
**Permissions**: Everyone  
**Effect**: Protects from accidental release

## 🃏 Trading Card Commands

### `/cards buy <packs> [set]`
**Description**: Buy card packs  
**Usage**: `/cards buy 3 classic`  
**Cost**: 100 coins per pack  
**Permissions**: Everyone  
**Sets**: `classic`, `rare`, `legendary`

### `/cards collection [user] [page]`
**Description**: View card collection  
**Usage**: `/cards collection @user 2`  
**Permissions**: Everyone  
**Shows**: Cards with rarity and quantity

### `/cards info <card_name>`
**Description**: View detailed card information  
**Usage**: `/cards info Blue-Eyes White Dragon`  
**Permissions**: Everyone  
**Shows**: Stats, rarity, description, artwork

### `/deck create <name>`
**Description**: Create a new deck  
**Usage**: `/deck create "My Dragon Deck"`  
**Permissions**: Everyone  
**Limit**: 5 decks per user

### `/deck add <deck_name> <card_name> <quantity>`
**Description**: Add cards to a deck  
**Usage**: `/deck add "My Dragon Deck" "Blue-Eyes White Dragon" 3`  
**Permissions**: Everyone  
**Deck Limit**: 60 cards maximum

### `/deck view <deck_name>`
**Description**: View deck contents  
**Usage**: `/deck view "My Dragon Deck"`  
**Permissions**: Everyone  
**Shows**: All cards with quantities

### `/deck remove <deck_name> <card_name> <quantity>`
**Description**: Remove cards from deck  
**Usage**: `/deck remove "My Dragon Deck" "Blue-Eyes White Dragon" 1`  
**Permissions**: Everyone

### `/cards trade <user> <your_cards> <their_cards>`
**Description**: Trade cards with another user  
**Usage**: `/cards trade @user "Blue-Eyes" "Red-Eyes"`  
**Permissions**: Everyone  
**Interactive**: Both users must confirm

### `/cards market`
**Description**: View the trading marketplace  
**Usage**: `/cards market`  
**Permissions**: Everyone  
**Shows**: Active trade offers

### `/cards sell <card_name> <quantity> <price>`
**Description**: List cards for sale  
**Usage**: `/cards sell "Blue-Eyes White Dragon" 1 500`  
**Permissions**: Everyone  
**Fee**: 5% transaction fee

## 🎭 Social Interaction Commands

### `/hug <user> [message]`
**Description**: Give someone a warm hug  
**Usage**: `/hug @user You're awesome!`  
**Permissions**: Everyone  
**Cooldown**: 3 seconds

### `/kiss <user> [message]`
**Description**: Give someone a sweet kiss  
**Usage**: `/kiss @user Good morning!`  
**Permissions**: Everyone  
**Cooldown**: 3 seconds

### `/pat <user> [message]`
**Description**: Pat someone's head gently  
**Usage**: `/pat @user Good job!`  
**Permissions**: Everyone  
**Cooldown**: 3 seconds

### `/poke <user> [message]`
**Description**: Poke someone playfully  
**Usage**: `/poke @user Hey there!`  
**Permissions**: Everyone  
**Cooldown**: 3 seconds

### `/slap <user> [message]`
**Description**: Playfully slap someone  
**Usage**: `/slap @user Stop being silly!`  
**Permissions**: Everyone  
**Cooldown**: 3 seconds

### `/dance [style]`
**Description**: Show off your dance moves  
**Usage**: `/dance salsa`  
**Styles**: `salsa`, `breakdance`, `waltz`, `robot`  
**Permissions**: Everyone  
**Cooldown**: 5 seconds

### `/cry [reason]`
**Description**: Express sadness  
**Usage**: `/cry I lost my favorite Pokémon`  
**Permissions**: Everyone  
**Cooldown**: 10 seconds

### `/laugh [at]`
**Description**: Express laughter  
**Usage**: `/laugh at that joke`  
**Permissions**: Everyone  
**Cooldown**: 5 seconds

## 🎱 Entertainment Commands

### `/8ball <question>`
**Description**: Ask the magic 8-ball a question  
**Usage**: `/8ball Will I catch a shiny Pokémon today?`  
**Permissions**: Everyone  
**Cooldown**: 5 seconds  
**Responses**: 20 different mystical answers

### `/meme <template> <top_text> <bottom_text>`
**Description**: Generate a custom meme  
**Usage**: `/meme drake "Using old bot" "Using Tatiana Bot 2.0"`  
**Templates**: `drake`, `distracted`, `woman_yelling`, `expanding_brain`  
**Permissions**: Everyone  
**Cooldown**: 30 seconds

### `/meme random`
**Description**: Get a random meme  
**Usage**: `/meme random`  
**Permissions**: Everyone  
**Cooldown**: 15 seconds

### `/trivia [category] [difficulty]`
**Description**: Start a trivia question  
**Usage**: `/trivia anime easy`  
**Categories**: `general`, `anime`, `gaming`, `science`, `history`  
**Difficulty**: `easy`, `medium`, `hard`  
**Permissions**: Everyone  
**Reward**: 10-50 coins for correct answers

### `/hangman [category]`
**Description**: Start a hangman game  
**Usage**: `/hangman pokemon`  
**Categories**: `pokemon`, `anime`, `general`  
**Permissions**: Everyone  
**Reward**: 25 coins for solving

### `/guess`
**Description**: Number guessing game  
**Usage**: `/guess`  
**Range**: 1-100  
**Attempts**: 7 tries  
**Permissions**: Everyone  
**Reward**: 20 coins for guessing correctly

### `/joke [category]`
**Description**: Get a random joke  
**Usage**: `/joke programming`  
**Categories**: `general`, `programming`, `dad`, `anime`  
**Permissions**: Everyone  
**Cooldown**: 10 seconds

## 📊 Information Commands

### `/serverinfo`
**Description**: Display comprehensive server information  
**Usage**: `/serverinfo`  
**Shows**: Member count, channels, roles, boost level, creation date  
**Permissions**: Everyone  
**Cooldown**: 30 seconds

### `/userinfo [user]`
**Description**: Display user information and statistics  
**Usage**: `/userinfo @user`  
**Shows**: Join date, roles, level, economy stats, badges  
**Permissions**: Everyone  
**Cooldown**: 10 seconds

### `/ping`
**Description**: Check bot latency and status  
**Usage**: `/ping`  
**Shows**: Bot ping, API ping, database ping  
**Permissions**: Everyone  
**Cooldown**: 10 seconds

### `/avatar [user]`
**Description**: Display user's avatar  
**Usage**: `/avatar @user`  
**Shows**: Full-size avatar with download link  
**Permissions**: Everyone  
**Cooldown**: 5 seconds

### `/roles [user]`
**Description**: List all server roles or user's roles  
**Usage**: `/roles @user`  
**Shows**: Role list with member counts and colors  
**Permissions**: Everyone  
**Cooldown**: 15 seconds

### `/channels [type]`
**Description**: List server channels  
**Usage**: `/channels voice`  
**Types**: `all`, `text`, `voice`, `category`  
**Permissions**: Everyone  
**Cooldown**: 20 seconds

## 📊 Utility Commands

### `/poll <question> <option1> <option2> [option3] [option4] [option5]`
**Description**: Create an interactive poll  
**Usage**: `/poll "Best starter?" Bulbasaur Charmander Squirtle`  
**Duration**: 1 hour default  
**Permissions**: Everyone  
**Cooldown**: 2 minutes

### `/reminder <time> <message>`
**Description**: Set a personal reminder  
**Usage**: `/reminder 2h Check the lottery results`  
**Time Format**: `1m`, `1h`, `1d` (up to 7 days)  
**Permissions**: Everyone  
**Limit**: 5 active reminders per user

### `/announce <message> [channel]`
**Description**: Make a server announcement  
**Usage**: `/announce "Server maintenance tonight" #announcements`  
**Permissions**: Manage Server  
**Features**: Supports embeds and mentions

### `/welcome <message>`
**Description**: Set custom welcome message  
**Usage**: `/welcome Welcome {user} to our server!`  
**Variables**: `{user}`, `{server}`, `{membercount}`  
**Permissions**: Manage Server

### `/goodbye <message>`
**Description**: Set custom goodbye message  
**Usage**: `/goodbye {user} has left the server`  
**Variables**: `{user}`, `{server}`, `{membercount}`  
**Permissions**: Manage Server

## ⚙️ Configuration Commands

### `/config prefix <prefix>`
**Description**: Set custom command prefix  
**Usage**: `/config prefix ?`  
**Length**: 1-3 characters  
**Permissions**: Manage Server

### `/config language <language>`
**Description**: Set server language  
**Usage**: `/config language en`  
**Languages**: `en`, `es`, `fr`, `de`, `pt`, `ja`  
**Permissions**: Manage Server

### `/config toggle <feature>`
**Description**: Enable/disable bot features  
**Usage**: `/config toggle economy`  
**Features**: `economy`, `pokemon`, `cards`, `automod`, `leveling`  
**Permissions**: Manage Server

### `/config logs <channel>`
**Description**: Set logging channel  
**Usage**: `/config logs #mod-logs`  
**Events**: Moderation, joins/leaves, message edits/deletes  
**Permissions**: Manage Server

### `/config autorole <role>`
**Description**: Set automatic role for new members  
**Usage**: `/config autorole @Member`  
**Permissions**: Manage Roles

### `/config welcome_channel <channel>`
**Description**: Set welcome message channel  
**Usage**: `/config welcome_channel #welcome`  
**Permissions**: Manage Server

### `/help [command|category]`
**Description**: Display help information  
**Usage**: `/help economy` or `/help coinflip`  
**Categories**: `ai`, `moderation`, `economy`, `pokemon`, `cards`, `social`, `fun`, `info`, `config`  
**Permissions**: Everyone

### `/stats`
**Description**: View detailed bot statistics  
**Usage**: `/stats`  
**Shows**: Servers, users, commands executed, uptime  
**Permissions**: Everyone  
**Cooldown**: 60 seconds

## 📋 Command Categories Summary

| Category | Commands | Description |
|----------|----------|-------------|
| 🧠 **AI & Chat** | 4 commands | Intelligent conversations and AI management |
| 🛡️ **Moderation** | 8 commands | Server moderation and AutoMod features |
| 💰 **Economy** | 6 commands | Virtual currency and balance management |
| 🎰 **Gambling** | 6 commands | Casino games and lottery system |
| 🐾 **Pokémon** | 9 commands | Pokémon collection and battle system |
| 🃏 **Trading Cards** | 9 commands | Card collection and deck building |
| 🎭 **Social** | 8 commands | User interaction and roleplay commands |
| 🎱 **Entertainment** | 7 commands | Games, memes, and fun activities |
| 📊 **Information** | 6 commands | Server and user information display |
| 📊 **Utility** | 5 commands | Polls, reminders, and announcements |
| ⚙️ **Configuration** | 10 commands | Bot and server customization |

## 🔒 Permission Levels

| Level | Description | Required Discord Permission |
|-------|-------------|----------------------------|
| **Everyone** | All server members | None |
| **Moderator** | Trusted members | Kick Members, Manage Messages |
| **Administrator** | Server admins | Manage Server, Ban Members |
| **Owner** | Server owner | Server Owner |
| **Bot Developer** | Bot creators | Developer whitelist |

## ⏱️ Cooldown System

Commands have cooldowns to prevent spam and ensure fair usage:

- **Short (3-5s)**: Basic commands, social interactions
- **Medium (10-30s)**: Information commands, simple games  
- **Long (1-4h)**: Economy commands, work, rob
- **Daily (24h)**: Daily rewards, special events

## 🏆 Command Usage Statistics

Commands will track usage statistics for analytics:
- Total executions per command
- Success/failure rates
- Average response times
- Popular command combinations
- User engagement metrics

---

**Document Version**: 1.0  
**Last Updated**: January 2025  
**Total Commands**: 85+  
**Next Update**: With each new feature release 