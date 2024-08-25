function data()
return {
	info = {
		minorVersion = 0,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		},
		tags = { "europe", "waggon", "schuettgut", "deutschland", "germany", "UIC", "gueterwagen", "db" },
		tfnetId = { },
		minGameVersion = 0,
		dependencies = { },
		url = { "" },

        params = {
			{
				key = "fans128fake",
				name = _("Fake_fans128_wagen"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_fans128_desc"),
				defaultIndex = 0,
			},
        },
	},
	options = {
	},
	
	runFn = function (settings, modParams)
	
        local hidden = {
			["DBCargo_fake.mdl"] = true,
			["handbremse_DBCargo_fake.mdl"] = true,
			["handbremse_Railion_fake.mdl"] = true,
            ["Railion_fake.mdl"] = true,   
        }

		local modelFilter = function(fileName, data)
			local modelName = fileName:match('/Fans128_([^/]*.mdl)')
			return (modelName==nil or hidden[modelName]~=true)
		end

        if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["fans128fake"] == 0 then
				addFileFilter("model/vehicle", modelFilter)
			end
		else
			addFileFilter("model/vehicle", modelFilter)
		end

	end
	}
end
