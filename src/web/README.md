## Screenshots

![preview](https://cdn.discordapp.com/attachments/814225677129351201/979507767016583278/hud.png)

## Installation

Go to the project directory

```bash
  cd web
```

Install dependencies

```bash
  npm install
```

Start the server

```bash
  npm start
```

Build the project

```bash
  npm run build
```

## Usage/Examples

```lua
local hideValue = false

---toggleHud
---@return void
local function toggleHud()
	hideValue = not hideValue

	SendNUIMessage({
		hidden = hideValue
	});
end

---updateHudValues
---@param hunger number
---@param thirst number
---@param cash number
---@return void
---@public

function updateHudValues(hunger, thirst, cash)
	SendNUIMessage({
		type = "UPDATE_HUNGER_THIRST_CASH",
		values = {
			hunger = hunger,
			thirst = thirst,
			cash = cash
		}
	})
end

RegisterCommand("toggleHud", function()
	toggleHud()
end, false)

RegisterNUICallback("hud", function(data, cb)
	SetNuiFocus(false, false)
	cb({})
end)
```
