SMODS.Atlas({
	key = "speedrun",
	path = "j_speedrun.png",
	px = 71,
	py = 95,
})

SMODS.Joker({
	key = "speedrun",
	atlas = "speedrun",
	rarity = 2,
	cost = 6,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	loc_vars = function(self, info_queue, card)
		MP.UTILS.add_nemesis_info(info_queue)
		return { vars = {} }
	end,
	in_pool = function(self)
		return MP.LOBBY.code and MP.LOBBY.config.multiplayer_jokers
	end,
	calculate = function (self,card,context)
		if context.cardarea == G.jokers and context.mp_readied_up and context.mp_is_first then
				card:juice_up()
				if #G.consumeables.cards < G.consumeables.config.card_limit then
				local card = create_card("Spectral", G.consumeables, nil, nil, nil, nil, nil, "speedrun")
				card:add_to_deck()
				G.consumeables:emplace(card)
			end
		end
		
	end,
	mp_credits = {
		idea = { "Virtualized" },
		art = { "Aura!" },
		code = { "Virtualized" },
	},
})
