callbacks_api = {}
function callbacks_api.register_callback(cb_registrar, cb, ...)
	if not cb_registrar then
		minetest.log("warning", "callbacks_api: Callback registrar does not exist.")
		return
	end

	assert(cb_registrar and type(cb_registrar) == "function",
		"callbacks_api: Callback registrar passed to register_callback is not a function!")

	cb_registrar(cb, ...)
end
