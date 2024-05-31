local Queue = {
	['group:1'] = {
		players = {
			[1] = {
				nick = 'ViperGT',
				leader = true
			}
		}
	},
	['group:4'] = {
		players = {
			[1] = {
				nick = 'BlazeGamer',
				leader = false
			},
			[2] = {
				nick = 'SpeedRacer',
				leader = false
			},
			[3] = {
				nick = 'ShadowNinja',
				leader = true
			},
			[4] = {
				nick = 'PhoenixFire',
				leader = false
			}
		}
	},
	['group:6'] = {
		players = {
			[1] = {
				nick = 'ThunderBolt',
				leader = true
			},
			[2] = {
				nick = 'GhostRider',
				leader = false
			}
		}
	},
	['group:9'] = {
		players = {
			[1] = {
				nick = 'NeonSpectre',
				leader = false
			},
			[2] = {
				nick = 'DriftKing',
				leader = true
			}
		}
	},
	['group:10'] = {
		players = {
			[1] = {
				nick = 'MidnightWolf',
				leader = true
			}
		}
	},
}

function getQueue()
	local teams = {
		attackers = {
			players = {}
		},
		defenders = {
			players = {}
		},
	}
	local function notCompletedTeams()
		local notFull = false
		for k,v in pairs(teams) do
			if #teams[k].players < 5 then
				notFull = true
			end
		end
		return notFull
	end
	CreateThread(function()
		while notCompletedTeams() do
			for k,v in pairs(Queue) do
				for k2,v2 in pairs(teams) do
					if #teams[k2].players == 0 or (#teams[k2].players + #v.players <= 5) then
						for k3, v3 in pairs(v.players) do
							teams[k2].players[#teams[k2].players+1] = {nick = v3.nick, group = k, leader = v3.leader}
						end
						goto next_group
					end
				end
				::next_group::
			end
			Wait(500)
		end
	end)
	collectgarbage("collect")
	return teams
end
