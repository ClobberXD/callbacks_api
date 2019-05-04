# `callbacks_api`

callbacks_api is a framework for registering callbacks if the callback registration function exists, else returning gracefully. The following function is used to register a callback. This mod can be very handy when developing or prototyping new callbacks, either within a mod, or within Minetest itself.

## `callbacks_api.register_callback(cb_registrar, cb, ...)`

Register callback `cb` (along with optional arguments `...`) to `cb_registrar`, if it exists, or return gracefully.

### Parameters

- `cb_registrar` [`function`]: The function that registers the callback.
- `cb` [`function`]: The callback itself.
- `...` [Comma-separated arguments]: Optional arguments to pass to `cb_registrar`, along with `cb`.

## Examples

```lua
local function callback(player, hpchange)
    minetest.log("action", player:get_player_name() .. "'s HP changed!\n" ..
            "old_hp = " .. player:get_hp() - hpchange .. ",\n" ..
            "new_hp = " .. player:get_hp())
end

-- cb_registrar = minetest.register_on_player_hpchange
-- cb = callback
-- ... = false
callbacks_api.register_callback(minetest.register_on_player_hpchange, callback, false)
```
