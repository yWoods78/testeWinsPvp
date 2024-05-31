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
		for team,_ in pairs(teams) do
			if #teams[team].players < 5 then
				notFull = true
			end
		end
		return notFull
	end
	while notCompletedTeams() do
		for group,tablePlayers in pairs(Queue) do
			for team,_ in pairs(teams) do
				if #teams[team].players == 0 or (#teams[team].players + #tablePlayers.players <= 5) then
					for _, player in pairs(tablePlayers.players) do
						teams[team].players[#teams[team].players+1] = {nick = player.nick, group = group, leader = player.leader}
					end
					goto next_group
				end
			end
			::next_group::
		end
	end
	return teams
end

print(json.encode(getQueue(),{indent = true}))