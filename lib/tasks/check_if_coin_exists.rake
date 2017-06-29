task :check_if_coin_exists => :environment do

	networks = [
				{name: "Civic", location: "San Francisco, CA", category: "14", description: "On-demand, secure and low-cost access to identity verification via the blockchain", blockchain: "Ethereum"} ,
				{name: "Status", location: "Switzerland", category: "24", description: "An open source consumer mobile messaging app to interact with decentralized applications that run on the Ethereum Network."}, 
				{name: "Bancor", location: "Tel Aviv, Israel", category: "12", description: "Ethereum-based token conversion protocol that uses reserve tokens to support trading liquidity and to back the creation of new tokens.", blockchain: "Ethereum"} ,
				{name: "Mysterium", location: "Lithuania", category: "34", description: "A decentralized, peer to peer based, serverless VPN network built using Ethereum contracts.", blockchain: "Ethereum"} ,
				{name: "Storj", location: "British Virgin Islands", category: "25", description: "A network for peer-to-peer sale of decentralized cloud storage.", blockchain: "Ethereum"} ,
				{name: "Aragon", category: "13", blockchain: "Ethereum"} ,
				{name: "TokenCard", category: "20", blockchain: "Ethereum"} ,
				{name: "MobileGo", location: "Dispersed", category: "35", description: "A mobile gaming platform to buy in-game content and create gamer profiles to compete in live tournaments, gain early access to games' private betas and achieve gaming social status", blockchain: "Ethereum & Waves"} ,
				{name: "Gnosis", category: "21", blockchain: "Ethereum"} ,
				{name: "IEX.EC", location: "Lyon, France", category: "4", description: "A decentralized marketplace for computing resources", blockchain: "Ethereum"} ,
				{name: "Cosmos", category: "16"}, 
				{name: "Humaniq", location: "Novosibirsk, Russia", category: "12", description: "Provides a financial banking app with biometric technology in the hopes of expanding banking services to those in undeveloped countries that are underbanked.", blockchain: "Ethereum"} ,
				{name: "Aeternity", location: "Liechtenstein", category: "23", description: "A smart contract platform that stores contracts off chain to increase efficiency. Aeternity uses a native oracle machine to read off chain data."}, 
				{name: "Qtum", location: "Singapore", category: "23", description: "A proof-of-stake, smart-contract compatible protocol that works with both Ethereum and Bitcoin dapps.", blockchain: "Bitcoin & Ethereum"} ,
				{name: "Chronobank", location: "Australia", category: "29", description: "A platform for people to buy and sell labor. Labor Hour tokens (LH) are backed by people-hours.", blockchain: "Ethereum"} ,
				{name: "Golem", location: "Poland", category: "4", description: "A peer-to-peer network for the sale of computing resources", blockchain: "Ethereum"} ,
				{name: "SingularDTV", location: "Switzerland", category: "19", description: "Along with producing original content in the form of documentaries, SingularDTV is a blockchain-based content management platform where artists can sell their work and the company will post other original content after acquiring their rights", blockchain: "Ethereum"} ,
				{name: "FirstBlood", location: "Boston, MA", category: "35", description: "FirstBlood is a decentralized app, built on top of Ethereum, that allows eSports enthusiasts to compete in their favorite games through a decentralized, automated platform", blockchain: "Ethereum"} ,
				{name: "ICONOMI", location: "Slovenia", category: "12", description: "ICONOMI is a decentralized crypto-fund platform, providing an index fund and hedge fund for cryptocurrencies.", blockchain: "Ethereum"} ,
				{name: "Waves", location: "Russia", category: "23", description: "WAVES is a crypto-platform for asset/custom token issuance, transfer, and trading on blockchain. It's a cryptocurrency platform with emphasis on custom token creation, transfer and decentralized trading, with deep fiat integration and focus on community-backed projects.", blockchain: "Waves"} ,
				{name: "Lisk", location: "Berlin, Germany", category: "2", description: "A decentralized application platform allows the deployment, distribution and monetisation of decentralized applications and custom blockchains onto the Lisk blockchain.", blockchain: "Ethereum"} ,
				{name: "Augur", category: "38", blockchain: "Ethereum"} ,
				{name: "Ethereum", category: "23"}, 
				{name: "Cofound.it", category: "5"}, 
				{name: "Patientory", category: "8"}, 
				{name: "Metal", category: "6"}, 
				{name: "Aira", category: "24"}, 
				{name: "BidLend", category: "12", blockchain: "ethereum"} ,
				{name: "Monaco", category: "20"}, 
				{name: "Suretly", category: "12"}, 
				{name: "Minexcoin", category: "20"}, 
				{name: "Zrcoin", category: "1"}, 
				{name: "BOScoin", category: "23"}, 
				{name: "VOISE", category: "19"}, 
				{name: "Embermine", category: "19"}, 
				{name: "Quantum Resistant Ledger", category: "1"}, 
				{name: "Viva Coin", category: "6"}, 
				{name: "Adel", category: "7"}, 
				{name: "Back to Earth", category: "1"}, 
				{name: "Sikoba", category: "12"}, 
				{name: "Veritaseum", category: "12"}, 
				{name: "Exscudo", category: "12"}, 
				{name: "Ethbits", category: "12"}, 
				{name: "Rchain", category: "34"}, 
				{name: "MetaGold", category: "35"}, 
				{name: "Lunyr", category: "19", blockchain: "ethereum"} ,
				{name: "Creativechain", category: "19"}, 
				{name: "Edgeless", category: "35", blockchain: "ethereum"} ,
				{name: "Apptrade", category: "12"}, 
				{name: "Chain of Points", category: "1", blockchain: "ethereum"} ,
				{name: "Peerplays", category: "21"}, 
				{name: "Melon", category: "12", blockchain: "ethereum"} ,
				{name: "Dfinity", category: "4"}, 
				{name: "Lykke", category: "12", blockchain: "bitcoin"} ,
				{name: "Equibit", category: "12"}, 
				{name: "Augmentors", category: "35"}, 
				{name: "Wings", category: "21"}, 
				{name: "vDice", category: "38"}, 
				{name: "Ark", category: "16"}, 
				{name: "Komodo", category: "6"}, 
				{name: "Bitgirls", category: "1"}, 
				{name: "DarkSilk", category: "6"}, 
				{name: "Decent", category: "19"}, 
				{name: "Antshares", location: "Shanghai, China", category: "12", description: "Antshares is a decentralized network protocol based on blockchain technology. People can use it to digitalize assets or shares, and accomplish financial business such as registration and issuing, transactions, settlement and payment through a peer-to-peer network."}, 
				{name: "Kibo", category: "38", blockchain: "ethereum"} ,
				{name: "Synereo", category: "4"}, 
				{name: "DeClouds", category: "12"}, 
				{name: "BlockPay", category: "20"}, 
				{name: "Metaverse", category: "14"}, 
				{name: "Incent", category: "37"}, 
				{name: "Tao Network", category: "19"}, 
				{name: "Plimst", category: "39"}, 
				{name: "CryptoChip", category: "1"}, 
				{name: "0x", category: "12", blockchain: "ethereum"} ,
				{name: "Indorse", category: "24"}, 
				{name: "OneGram", category: "12"}, 
				{name: "Hive Project", category: "12", blockchain: "ethereum"} ,
				{name: "district0x Network", category: "18"}, 
				{name: "onG.social", category: "24"}, 
				{name: "MyBit", category: "12"}, 
				{name: "Populous", category: "12"}, 
				{name: "Agrello", category: "23", blockchain: "ethereum"} ,
				{name: "Starbase", category: "5"}, 
				{name: "Tezos", category: "23"}, 
				{name: "XinFin Foundation", category: "11"}, 
				{name: "Stremio Adex", category: "39"}, 
				{name: "SunContract", category: "10", blockchain: "ethereum"} ,
				{name: "Dao.Casino", category: "38"}, 
				{name: "OmiseGO", category: "11"}, 
				{name: "Nimiq", category: "28"}, 
				{name: "TenX", category: "20"}, 
				{name: "SkinCoin", category: "35"}, 
				{name: "SilverCoin", category: "24"}, 
				{name: "Gilgam", category: "35", blockchain: "ethereum"} ,
				{name: "Xarcade", category: "35"}, 
				{name: "Corion Platform", category: "20"}, 
				{name: "SONM", category: "4", blockchain: "ethereum"} ,
				{name: "CompCoin", category: "12"}, 
				{name: "Orocrypt", category: "1"}, 
				{name: "Honestis Network", category: "14"}, 
				{name: "SuperDAO", category: "7"}, 
				{name: "FundYourselfNow", category: "5"}, 
				{name: "Gene-ChainCoin", category: "8"}, 
				{name: "Prospectors", category: "35"}, 
				{name: "Air", category: "14"}, 
				{name: "DCORP", category: "11"}, 
				{name: "Wagerr", category: "38"}, 
				{name: "Polybius", category: "12"}, 
				{name: "Moeda", category: "12"}, 
				{name: "Octanox", category: "6"}, 
				{name: "FootballCoin", category: "35"}, 
				{name: "MaskNetwork", category: "24"}, 
				{name: "Crypviser", category: "24"}, 
				{name: "LeviarCoin", category: "35"}, 
				{name: "Internet of Coins", category: "12"}
	]

	coins = [
		{name: "Civic",symbol: "CVC",sale_date: "2017-06-21",ico_actual_end_date: "2017-06-21",ico_planned_end_date: "2017-06-28",capital_raised: "33000000",coin_info: "Validators and users receive CVC for data. CVCs can purchase identity-related products and services",coin_status: "concept",ico_use_of_proceeds: "No specific breakdown of use of funds",ico_token_sale_structure: "Two capped sales (pre-sale & public) with fixed prices",coin_pricing: "1 CVC = $0.10",ico_amount_sold: "1000000000",ico_allocation: "11% to public sale, 22% to pre-sale, 33% to partners, 33% to team, 1% to token costs",ico_founder_lockup: "3 years, 1/3 to be released every year",ico_min_investment_cap: "None",ico_type_of_min_cap: "None",ico_max_investment_cap: "33000000",ico_type_of_max_cap: "Disclosed",ico_currency_accepted: "ETH & BTC"},
		{name: "Status",symbol: "SNT",sale_date: "2017-06-20",ico_actual_end_date: "2017-06-20",ico_planned_end_date: "2017-07-03",capital_raised: "Unconfirmed",coin_info: "The SNT token allows you to purchase access to services, register, deploy group chats and vote in protocol decisions",coin_status: "concept",ico_use_of_proceeds: "50% Core Development, 15% Security, 10% Marketing, 15% Operations, 10% Legal",ico_token_sale_structure: "Capped with redistribution, curved ceiling.",coin_pricing: "10,000 SNT = 1 ETH",ico_allocation: "33% sold in the tokensale. 33% retained by Civic. 33% allocated for distribution to incentivize participation in the ecosystem. 1% to cover tokensale costs",ico_buyer_lockup: "7 days after ICO period ends",ico_max_investment_cap: "12,000,000 CHF + hidden cap",ico_type_of_max_cap: "Mixed",ico_currency_accepted: "ETH"},
		{name: "Bancor",symbol: "BANCOR",sale_date: "2017-06-12",ico_actual_end_date: "2017-06-12",capital_raised: "153000000",coin_info: "The Bancor Token will be the first token launched on the protocol, backed by the ETH in the crowdsale at a 20% Constant Reserve Ratio (CRR). The Bancor Token can be used by anyone to back additional SmartTokens.",coin_status: "concept",ico_use_of_proceeds: "40% Software Development, 20% Bancor ETH Reserve, 12% Marketing and Business Development, 10% Seeding Token Changers and ETFs, 8% Operational Expenses, 5% Legal Expenses, 5% Misc and Unexpected",ico_token_sale_structure: "Uncapped for first hour, cap is revealed when project hits 80% of goal",coin_pricing: "Fixed initial price of 1 BANCOR for 0.01 ETH",ico_amount_sold: "79323978",ico_allocation: "50% to ICO, 20% for long-term budget, 20% to community grants, partnerships, and bounties, 10% to founders, advisors, and early contributors.",ico_founder_lockup: "18 months",ico_min_investment_cap: "NA",ico_max_investment_cap: "390000 ETH",ico_type_of_max_cap: "Hidden",ico_currency_accepted: "ETH"},
		{name: "Basic Attention Token",symbol: "BAT",sale_date: "2017-05-31",ico_actual_end_date: "2017-05-31",ico_planned_end_date: "2017-06-29",capital_raised: "35000000",coin_info: "Payment rights, medium of exchange.
		BAT token is used by advertisers to pay users to view ads, and for users to donate to content publishers",coin_status: "concept",ico_use_of_proceeds: "70% used to support the development and growth of the BAT ecosystem, which includes the Ethereum-based smart contract system and the Brave browser. 58% for BAT development team, 10% administration, 12% marketing, 13% contractors, 7% contigency",ico_token_sale_structure: "One-time capped sale",coin_pricing: "1 ETH = 6,400 BAT",ico_amount_sold: "1500000000",ico_allocation: "1 billion for token sale, 300 million for user growth pool, 200 million for the BAT development pool",ico_buyer_lockup: "None",ico_founder_lockup: "6 months",ico_min_investment_cap: "5000000",ico_type_of_min_cap: "Disclosed",ico_max_investment_cap: "156,250 ETH",ico_type_of_max_cap: "Disclosed",ico_currency_accepted: "USD, ETH"},
		{name: "Mysterium",symbol: "MYST",sale_date: "2017-05-30",ico_actual_end_date: "2017-05-30",capital_raised: "14075000",coin_info: "Access rights, payment rights, fee-sharing rights",coin_status: "concept",ico_use_of_proceeds: "40% Core Development, 25% Operational, 25% Marketing and Sales, 10% Legal and Compliance",coin_pricing: "1 Swiss Franc (CHF) = 1.2 MYST",ico_amount_sold: "90000000",ico_founder_lockup: "12 months",ico_min_investment_cap: "1000000",ico_type_of_min_cap: "Goal",ico_max_investment_cap: "CHF6,000,000.00",ico_type_of_max_cap: "soft_cap",ico_currency_accepted: "ETH"},
		{name: "Storj",symbol: "STORJ",sale_date: "2017-05-19",ico_actual_end_date: "2017-05-25",ico_planned_end_date: "2017-06-19",capital_raised: "30000000",coin_info: "Payment rights, access to a product or service, medium of exchange. Tokens are used to buy and sell storage services and computing power through the Storj software application.",coin_status: "concept",ico_use_of_proceeds: "45% to technical staff, 35% to non-technical staff, 10% to marketing, 8% to infrastructure, 7% to other operating expenses",ico_token_sale_structure: "Capped sale of up to 25% of current market cap (500M) with 1 token being burned for every token sold ",coin_pricing: "$0.50 per token. Pre-sale discount: $50k-$100k: 10% (3-month lockup), >$100k: 20% (6-month lockup)",ico_amount_sold: "500000000",ico_allocation: "All tokens will be sold, those than remain will be put until 6-month lockup and then used for future developments",ico_buyer_lockup: "See left",ico_founder_lockup: "6-month lockup period for tokens not sold. Founders & investors don't receive any remaining tokens",ico_min_investment_cap: "10000000",ico_type_of_min_cap: "Disclosed",ico_max_investment_cap: "30000000",ico_type_of_max_cap: "Disclosed",ico_currency_accepted: "BTC or ETH"},
		{name: "Aragon",symbol: "ANT",sale_date: "2017-05-17",ico_actual_end_date: "2017-05-17",capital_raised: "24750000",coin_info: "Voting rights, access rights",coin_status: "concept",ico_use_of_proceeds: "65% for development, 17% for operations, 12% for marketing, 5% for legal. Most of the development effort will be focused on Aragon Core — the set of core contracts that power an organization, and the interface to manage them. ",coin_pricing: "100 ANT = 1 ETH for first two weeks, 66 ANT = 1 ETH for next two weeks",ico_amount_sold: "Secret cap, but now: 39,609,523",ico_allocation: "70% will go to purchasers, 15% to the Foundation, and 15% to the founders and early contributors who have worked on the project. The founder and early contributors will all have vesting.",ico_type_of_min_cap: "Hidden",ico_max_investment_cap: "NA",ico_type_of_max_cap: "Hidden",ico_currency_accepted: "ETH"},
		{name: "TokenCard",symbol: "TKN",sale_date: "2017-05-02",ico_actual_end_date: "2017-05-02",capital_raised: "12700000",coin_info: "Fee-sharing rights, voting rights",coin_status: "concept",ico_use_of_proceeds: "30% Core Development, 25% Operational, 40% Marketing, 5% Legal and Compliance",coin_pricing: "Bonus Schedule dependent on amount contributed: $0-$750K: 150 TKN = 1 ETH. $750K-$1.5M: 140 TKN = 1 ETH. $1.5M - $2.25M: 130 TKN = 1 ETH. $2.25M - $3M: 120 TKN = 1 ETH. $3M - $3.75M: 110 TKN = 1 ETH. $3.75M - $4.5M: 100 TKN = 1 ETH. Overage period: 100 TKN = 1 ETH
		",ico_amount_sold: "21000000",ico_allocation: "64.8% to purchasers with the rest to team and development",ico_buyer_lockup: "Immediately after sale ends",ico_min_investment_cap: "500000",ico_type_of_min_cap: "Disclosed",ico_max_investment_cap: "$4,500,000 + hidden cap",ico_type_of_max_cap: "soft_cap",ico_currency_accepted: "ETH, Fiat, and ERC20 tokens"},
		{name: "MobileGo",symbol: "MOBILEGO",sale_date: "2017-04-25",ico_actual_end_date: "2017-05-25",ico_planned_end_date: "2017-05-25",capital_raised: "53069235",coin_info: "Access rights, medium of exchange, payment rights, profit sharing. 1) Allows users to act as witnesses in decentralized tournaments, 2) Issues coupon reward discounts when using Gamecredits (GAME) to make purchases, 3) Sole means of payment in a decentralized market for in-game assets, 4) Token holders will be eligible to participate in a buyback program",coin_status: "concept",ico_use_of_proceeds: "50% to direct marketing, 20% to MobileGo features, 30% to administrative costs (legal & payment processing)",ico_token_sale_structure: "One-time capped sale, redistribution based on investment totals with bonuses factored in",coin_pricing: "1st week: 15% discount on all currencies + 7% discount for investments made with GAME, 2nd week: 10% discount on all currencies + 7% discount for investments made with GAME, 3rd week: 5% discount on all currencies + 7% discount for investments made with GAME, 4th week: Only a 10% discount on investments made with GAME",ico_amount_sold: "100000000",ico_allocation: "70% for distribution, 30% for crowdsale marketing, mobile platform partnerships, employee expansion and future development over the course of the next 5 years.",ico_buyer_lockup: "None",ico_founder_lockup: "Several weeks after ICO",ico_min_investment_cap: "None",ico_type_of_min_cap: "None",ico_max_investment_cap: "None",ico_type_of_max_cap: "None",ico_currency_accepted: "BTC, ETH, WAVES, ANS and GAME"},
		{name: "Gnosis",symbol: "GNO",sale_date: "2017-04-24",ico_actual_end_date: "2017-04-24",ico_planned_end_date: "Ends when token supply runs out",capital_raised: "12250000",coin_info: "GNO tokens are used to create WIZ tokens, which are in turn are used to buy services on the Gnosis platform. The more WIZ tokens that are used on the platform, the more will be generated per GNO.",coin_status: "concept",ico_use_of_proceeds: "65% employees, 12.5% marketing, 10% consultants, 7.5% legal/accounting, 5% miscellaneous",ico_token_sale_structure: "A reverse dutch auction, capped sale with decreasing price as time expires",coin_pricing: "Price determined at a falling rate",ico_amount_sold: "10000000",ico_allocation: "5% distributed if sale finished on first day (rest held by team), 10% on second day and so on. Results: sale ended on first day. Lockup period of over a year of the ones held by founders",ico_buyer_lockup: "None",ico_founder_lockup: "At least a year",ico_min_investment_cap: "None",ico_type_of_min_cap: "None",ico_max_investment_cap: "$12,500,000 or 9,000,000 GNO",ico_type_of_max_cap: "Disclosed",ico_currency_accepted: "ETH"},
		{name: "IEX.EC",symbol: "RLC",sale_date: "2017-04-19",ico_actual_end_date: "2017-04-19",ico_planned_end_date: "2017-05-19",capital_raised: "12120000",coin_info: "Payment rights, access rights. The RLC token is the sole means of paying for services on the iEx.ec platform.",coin_status: "concept",ico_use_of_proceeds: "55% exec team, 10% office & indirect, 8% marketing & communication, 10% contactors, 9% contigency, 8% research",coin_pricing: "1 BTC = 5,000 RLC
		Bonus schedule: 20% for first 10 days, 10% for next ten days",ico_amount_sold: "87000000",ico_allocation: "Max 60M to investors. Breakdown: 69% token sale, 17% team & early investors, 7% contingency reserve, 7% development fund",ico_buyer_lockup: "No lockup",ico_founder_lockup: "No lockup",ico_min_investment_cap: "10000000",ico_type_of_min_cap: "Disclosed",ico_max_investment_cap: "60000000",ico_type_of_max_cap: "Disclosed",ico_currency_accepted: "BTC"},
		{name: "Cosmos",symbol: "ATOM",sale_date: "2017-04-06",ico_actual_end_date: "2017-04-06",capital_raised: "16800000",coin_info: "Used to stake nodes in PoS Consensus",coin_status: "concept",ico_amount_sold: "TBA",ico_allocation: "75% pre-fundraiser and fundraiser, 10% Interchain Foundation, 10% All in Bits, Inc., 5% Seed Investors",ico_min_investment_cap: "TBA",ico_max_investment_cap: "TBA",ico_currency_accepted: "ETH, BTC"},
		{name: "Humaniq",symbol: "HMQ",sale_date: "2017-04-06",ico_actual_end_date: "2017-04-26",ico_planned_end_date: "2017-04-26",capital_raised: "5100000",coin_info: "Store of value and means of payment",coin_status: "concept",ico_use_of_proceeds: "Towards mobile app, bio-authentication software, and creation of Humaniq ID nodes",ico_token_sale_structure: "Capped sale with a pre-ICO capped sale as well",coin_pricing: "1 ETH = 1000 HMQ. Bonus schedule: 49.9% in first 24hr, 33% in first week, 20% in second week, 14% in third week, 7% in fourth week",ico_amount_sold: "921000000",ico_allocation: "20% to contributors, 80% to team. No distribution discussion on what happens to the 80% remaining with the team before ICO.
		Post-ICO breakdown: 14% to Humaniq team, 6% for marketing/bounty, 8% for business development & advisory board",ico_currency_accepted: "ETH, BTC"},
		#REF!
		{name: "Qtum",symbol: "QTUM",sale_date: "2017-03-16",ico_actual_end_date: "2017-03-21",ico_planned_end_date: "2017-04-15",capital_raised: "15434476",coin_info: "Categories: payment rights, voting rights, medium of exchange
		The Qtum token serves multiple roles on the network. It’s used to pay fees, determine the distribution of newly minted tokens through a PoS mechanism, and grants holders voting rights in the Qtum governance organization. ",coin_status: "concept",ico_use_of_proceeds: "No formal breakdown, but according to white paper proceeds will be used for salaries, development outsourcing, administration, computers, software, tools, overhead, outside advisors, marketing",ico_token_sale_structure: "Capped one-time sale with price steps",coin_pricing: "Price steps. First two days: 1 BTC = 3,800 QTUM, 1 ETH = 115 QTUM; 1 week: 1 BTC = 3,600 QTUM, 1 ETH = 105 QTUM; 2nd week: 1 BTC = 3,400 QTUM, 1 ETH = TBD; 3rd week: 1 BTC = 3,200 QTUM, 1 ETH = TBD; 4th week: 1 BTC = 3,000 QTUM, 1 ETH = TBD",ico_amount_sold: "100000000",ico_allocation: "51% to participants, 20% to founding team, 29% for future research and development",ico_buyer_lockup: "Tokens will not be distributed until mainnet is launched",ico_founder_lockup: "Tokens will not be distributed until mainnet is launched",ico_min_investment_cap: "None",ico_type_of_min_cap: "None",ico_max_investment_cap: "51000000",ico_type_of_max_cap: "Disclosed",ico_currency_accepted: "BTC, ETH"},
		{name: "Chronobank",symbol: "TIME",sale_date: "2016-12-15",ico_actual_end_date: "2017-02-14",capital_raised: "5400000",coin_info: "Categories: medium of exchange, store of value, access rights
		TIME tokens will be sold and holders will receive a proportion of operating profits and voting rights. Labour-Hour Tokens (LHT) are the fundamental unit of value within the ChronoBank system. ",coin_status: "concept",ico_use_of_proceeds: "No specific breakdown for use of proceeds",coin_pricing: "100 TIME = 1 BTC",ico_amount_sold: "710112.8108",ico_allocation: "88% to fundraising, 10% to Chronobank team, 2% to advisors and early adopters",ico_buyer_lockup: "4 weeks after crowdsale",ico_min_investment_cap: "20,000 BTC, $16.5 million",ico_type_of_min_cap: "Goal",ico_max_investment_cap: "Uncapped",ico_type_of_max_cap: "Disclosed",ico_currency_accepted: "BTC"},
		{name: "Golem",symbol: "GNT",sale_date: "2016-11-11",ico_actual_end_date: "2016-11-11",ico_planned_end_date: "45 days",capital_raised: "8596000",coin_info: "Categories: medium of exchange, access rights
		",coin_status: "concept",ico_use_of_proceeds: "54% to Golem team, 10% to office & indirect, 11% to contractors, 10% to community & expansion, 5% to complimentary technologies, 10% to contigency",ico_token_sale_structure: "One-time, capped sale with no further coins created",coin_pricing: "1,000 GNT = 1 ETH",ico_amount_sold: "1000000000",ico_allocation: "82% to investors, 12% to Golem Factory, 6% to team",ico_buyer_lockup: "Until crowdsale closes",ico_founder_lockup: "Until crowdsale closes",ico_min_investment_cap: "150,000 ETH",ico_type_of_min_cap: "Disclosed",ico_max_investment_cap: "820,000 ETH",ico_type_of_max_cap: "Disclosed",ico_currency_accepted: "ETH"},
		{name: "SingularDTV",symbol: "SNGLS",sale_date: "2016-10-29",ico_actual_end_date: "2016-10-29",ico_planned_end_date: "2016-11-29",capital_raised: "7500000",coin_info: "The SNGLS tokens will confer holders with a claim to a portion of revenues and IP to show content. They will not have voting or governance rights, but they may have additional rights in the future. The tokens can also be used to pay for and view content.",coin_status: "concept",ico_use_of_proceeds: "Total of $7.5M raised:  ‘Singular’ Season 1 (3 episode mini-series): $3.25M. Documentary Division: $0.50M. Rights Management Development: $2.00M. Video-on-Demand Portal Development: $1.00M. Marketing: $0.50M. Administration, Legal & Contingency: $0.25M",ico_token_sale_structure: "Capped one-time sale",coin_pricing: "First 10 days: 1.5% discount per token, additional discounts every 10 days",ico_amount_sold: "1000000000",ico_allocation: "50% for distribution, 10% for team, 40% for storage in vault",ico_buyer_lockup: "Until crowdsale closes",ico_founder_lockup: "Until crowdsale closes",ico_min_investment_cap: "3750000",ico_type_of_min_cap: "Disclosed",ico_max_investment_cap: "7500000",ico_type_of_max_cap: "Disclosed",ico_currency_accepted: "ETH"},
		{name: "FirstBlood",symbol: "1SŦ",sale_date: "2016-09-26",ico_actual_end_date: "2016-09-26",ico_planned_end_date: "2016-10-23",capital_raised: "5500000",coin_info: "FirstBlood token allows users to 1) play in matches, 2) witness matches & vote on the jury, 3) host tournaments, 4) claim awards from referrals",coin_status: "concept",ico_use_of_proceeds: "ICO Funds Distribution: 40.8% tech & UI dev, 16.6% sales & marketing, 13.6% general & admin, 8.7% benefits, 7.9% misc & reserves, 7.1% legal , remains: Outsourcing, IT & Cybersecurity, Software",ico_token_sale_structure: "Capped one-time sale with price drops in steps",coin_pricing: "First hour: 170 1SŦ per 1 ETH, Sep 26 - Oct 2: 150 1SŦ per 1 ETH, Oct 3 - Oct 9: 133 1SŦ per 1 ETH, Oct 10 - Oct 16: 117 1SŦ per 1 ETH, Oct 17 - Oct 23: 100 1SŦ per 1 ETH",ico_amount_sold: "93,500,000 (max token amount if bought in first hour)",ico_allocation: "Founding team gets 10% of allocation, 5% will be allocated to eSports ecosystem
		",ico_buyer_lockup: "None",ico_founder_lockup: "Twelve-month",ico_min_investment_cap: "None",ico_type_of_min_cap: "None",ico_max_investment_cap: "5500000",ico_type_of_max_cap: "Disclosed",ico_currency_accepted: "ETH"},
		{name: "ICONOMI",symbol: "ICN",sale_date: "2016-08-25",ico_actual_end_date: "2016-09-26",ico_planned_end_date: "2016-09-26",capital_raised: "10355054.2",coin_info: "Token holders get weekly dividends based on the two funds' asset management fees and performance fees",coin_status: "concept",ico_use_of_proceeds: "No formal breakdown of proceeds.
		Proceeds will be put to the development and release of the ICONOMI platform",ico_token_sale_structure: "Capped one-time sale with bonus schedule",coin_pricing: "First week: 15% bonus, Second week: 10% bonus, Third week: 5% bonus. 10 days after ICO, distribution to investors will be determined by their contribution and bonus rate",ico_amount_sold: "100000000",ico_allocation: "85% to investors, 2% to adivsors, 8% to team, 3% to future team, 2% for bounties",ico_buyer_lockup: "10 days after ICO",ico_founder_lockup: "10 days after ICO",ico_min_investment_cap: "2000 BTC",ico_type_of_min_cap: "Disclosed",ico_max_investment_cap: "10,000 BTC",ico_type_of_max_cap: "Disclosed",ico_currency_accepted: "BTC, ETH, LSK, USD & EUR"},
		{name: "Waves",symbol: "WAVES",sale_date: "2016-04-12",ico_actual_end_date: "2016-05-31",ico_planned_end_date: "2016-05-31",capital_raised: "16010008",coin_info: "WAVES are needed in order to create customer tokens on the Waves platform.",coin_status: "concept",ico_use_of_proceeds: "Development of the platform",coin_pricing: "First ICO Day bonus: 20%, Before end of April: 10% bonus, May 1 - May 15: 5% bonus",ico_amount_sold: "100000000",ico_allocation: "85,000,000 to investors, 15,000,000 for core activities: 1 million for pre-ICO bounties, 1 million for post-ICO bounties, 4 million for strategic partners & backers, 9 million to the development team",ico_buyer_lockup: "Until end of ICO",ico_founder_lockup: "Until end of ICO",ico_min_investment_cap: "None",ico_type_of_min_cap: "None",ico_max_investment_cap: "None",ico_type_of_max_cap: "None",ico_currency_accepted: "USD & CAD"},
		{name: "Lisk",symbol: "LSK",sale_date: "2016-02-22",ico_actual_end_date: "2016-03-21",ico_planned_end_date: "2016-03-21",capital_raised: "5700000",coin_info: "LSK tokens are used to use the LSK dev platform or pay others to use it. Also, every LSK holder can vote for mainchain delegates which are securing the network.",coin_status: "concept",ico_use_of_proceeds: "Money will be used in the ecosystem for promotions, advertisements, salaries, travel costs, conference visits, sponsoring, Dapp fundings, development, designs, contractors, infrastructure, necessary devices, meetings, hostel/hotel costs and more.",ico_token_sale_structure: "Capped one-time sale with a bounty program without a cap on amount raised",coin_pricing: "0.0001821238671 BTC/LSK
		First week: 15% bonus, Second week: 10% bonus, Third week: 5% bonus, Fourth week: 0% bonus",ico_amount_sold: "100000000",ico_allocation: "85% for investors, 8% for core team, 4% for campaigns & bounties, 2% for advisors & partners, 1% for social bounty campaigns",ico_buyer_lockup: "Yes, paid out once first blocks have been forged successfully",ico_founder_lockup: "Yes, paid out once first blocks have been forged successfully",ico_min_investment_cap: "None",ico_type_of_min_cap: "None",ico_max_investment_cap: "None",ico_type_of_max_cap: "None",ico_currency_accepted: "BTC, XCR, ETH & partnership with shapeshift to accept any Altcoins"},
		{name: "Augur",symbol: "REP",sale_date: "2015-08-17",ico_actual_end_date: "2015-10-01",capital_raised: "5300000",coin_info: "Augur's Reputation tokens (REP) are held by reporters, who report on the outcome of events within Augur. Each token entitles the reporter to 1/22,000,000th of Augur's total market fees. ",coin_status: "concept",coin_pricing: "Aug 17 - Aug 22, 12:00pm (EST) 15% Discount True Augur. Aug 22 - Aug 27, 12:00pm (EST) 10% Discount Prophet. Aug 27 - Sep 5, 12:00pm (EST) 5% Discount Nate Silver. Sep 5 - Oct 1, 12:00pm (EST) No Discount Weatherman.",ico_amount_sold: "11000000",},
		{name: "Ethereum",symbol: "ETH",sale_date: "2014-07-20",ico_actual_end_date: "2014-09-02",ico_planned_end_date: "2014-09-02",capital_raised: "18400000",coin_info: "Ethereum's native value token, Ether, is mined through a Proof of Work protocol that is set to change to Proof of Stake. Ether is simply a token useful for paying transaction fees or building or purchasing decentralized application services on the Ethereum platform",coin_status: "concept",ico_token_sale_structure: "Uncapped",coin_pricing: "First 14 days: 2,000 ETH per BTC, Rest of the time: 1,337 ETH per BTC",ico_amount_sold: "Uncapped",ico_buyer_lockup: "Lockup until genesis block launches",ico_founder_lockup: "Lockup until genesis block launches",},
		{name: "Cofound.it",symbol: "CFI",sale_date: "2017-06-04",ico_actual_end_date: "2017-06-06",capital_raised: "--",coin_status: "concept"},
		{name: "Patientory",symbol: "PTOY",sale_date: "2017-05-31",ico_actual_end_date: "2017-06-03",capital_raised: "--",coin_status: "concept"},
		{name: "Metal",symbol: "METAL",sale_date: "2017-05-26",ico_actual_end_date: "2017-05-26",capital_raised: "--",coin_status: "concept"},
		{name: "Aira",symbol: "AIR",sale_date: "2017-05-25",ico_actual_end_date: "2017-06-11",capital_raised: "--",coin_status: "concept"},
		{name: "BidLend",symbol: "BLC",sale_date: "2017-05-20",ico_actual_end_date: "2017-06-19",capital_raised: "--",coin_status: "concept"},
		{name: "Monaco",symbol: "MCO",sale_date: "2017-05-18",ico_actual_end_date: "2017-06-18",capital_raised: "--",coin_status: "concept"},
		{name: "Suretly",symbol: "SUR",sale_date: "2017-05-16",ico_actual_end_date: "2017-05-30",capital_raised: "--",coin_status: "concept"},
		{name: "Minexcoin",symbol: "MNC",sale_date: "2017-05-15",ico_actual_end_date: "2017-06-13",capital_raised: "--",coin_status: "concept"},
		{name: "Zrcoin",symbol: "ZRC",sale_date: "2017-05-11",ico_actual_end_date: "2017-06-09",capital_raised: "--",coin_status: "concept"},
		{name: "BOScoin",symbol: "BOS",sale_date: "2017-05-09",ico_actual_end_date: "2017-05-10",capital_raised: "--",coin_status: "concept"},
		{name: "VOISE",symbol: "VSM",sale_date: "2017-05-06",ico_actual_end_date: "2017-06-06",capital_raised: "--",coin_status: "concept"},
		{name: "Embermine",symbol: "EMB",sale_date: "2017-05-05",ico_actual_end_date: "2017-06-02",capital_raised: "--",coin_status: "concept"},
		{name: "Quantum Resistant Ledger",symbol: "QRL",sale_date: "2017-05-01",ico_actual_end_date: "2017-05-07",capital_raised: "2808000",coin_status: "concept"},
		{name: "Viva Coin",symbol: "VIVA",sale_date: "2017-05-01",ico_actual_end_date: "2017-05-21",capital_raised: "--",coin_status: "concept"},
		{name: "Adel",symbol: "ADL",sale_date: "2017-05-01",ico_actual_end_date: "2017-06-01",capital_raised: "--",coin_status: "concept"},
		{name: "Back to Earth",symbol: "SRC",sale_date: "2017-04-26",ico_actual_end_date: "2017-04-28",capital_raised: "971250",coin_status: "concept"},
		{name: "Sikoba",symbol: "SKO",sale_date: "2017-04-25",ico_actual_end_date: "2017-05-15",capital_raised: "--",coin_status: "concept"},
		{name: "Veritaseum",symbol: "VER",sale_date: "2017-04-25",ico_actual_end_date: "2017-05-26",capital_raised: "--",coin_status: "concept"},
		{name: "Exscudo",symbol: "EON",sale_date: "2017-04-25",ico_actual_end_date: "2017-05-31",capital_raised: "--",coin_status: "concept"},
		{name: "Ethbits",symbol: "ETB",sale_date: "2017-04-15",ico_actual_end_date: "2017-05-15",capital_raised: "--",coin_status: "concept"},
		{name: "Rchain",symbol: "RCOIN",sale_date: "2017-04-05",ico_actual_end_date: "2017-04-16",capital_raised: "N/A",coin_status: "concept"},
		{name: "MetaGold",symbol: "MEG",sale_date: "2017-04-03",ico_actual_end_date: "2017-04-08",capital_raised: "Refunded",coin_status: "concept"},
		{name: "Lunyr",symbol: "LUN",sale_date: "2017-03-29",ico_actual_end_date: "2017-04-28",capital_raised: "--",coin_status: "concept"},
		{name: "Creativechain",symbol: "CREA",sale_date: "2017-03-15",ico_actual_end_date: "2017-05-01",capital_raised: "--",coin_status: "concept"},
		{name: "Edgeless",symbol: "EDG",sale_date: "2017-02-28",ico_actual_end_date: "2017-03-21",capital_raised: "2650788",coin_status: "concept"},
		{name: "Apptrade",symbol: "APPX",sale_date: "2017-02-28",ico_actual_end_date: "2017-04-30",capital_raised: "--",coin_status: "concept"},
		{name: "Chain of Points",symbol: "POINTS",sale_date: "2017-02-26",ico_actual_end_date: "2017-03-31",capital_raised: "--",coin_status: "concept"},
		{name: "Peerplays",symbol: "PPY",sale_date: "2017-02-26",ico_actual_end_date: "2017-05-15",capital_raised: "--",coin_status: "concept"},
		{name: "Melon",symbol: "MLN",sale_date: "2017-02-15",ico_actual_end_date: "2017-02-15",capital_raised: "2900000",coin_status: "concept"},
		{name: "Dfinity",symbol: "DFN",sale_date: "2017-02-11",ico_actual_end_date: "2017-02-12",capital_raised: "3750000",coin_status: "concept"},
		{name: "Lykke",symbol: "LKK",sale_date: "2017-02-09",ico_actual_end_date: "2017-02-28",capital_raised: "1973554",coin_status: "concept"},
		{name: "Equibit",symbol: "EQB",sale_date: "2017-02-01",ico_actual_end_date: "2017-03-31",capital_raised: "552000",coin_status: "concept"},
		{name: "Augmentors",symbol: "DBT",sale_date: "2017-01-31",ico_actual_end_date: "2017-03-01",capital_raised: "1087000",coin_status: "concept"},
		{name: "Wings",symbol: "WINGS",sale_date: "2016-11-18",ico_actual_end_date: "2017-01-06",capital_raised: "2074000",coin_status: "concept"},
		{name: "vDice",symbol: "VSL",sale_date: "2016-11-15",ico_actual_end_date: "2016-12-15",capital_raised: "1647000",coin_status: "concept"},
		{name: "Ark",symbol: "ARK",sale_date: "2016-11-07",ico_actual_end_date: "2016-12-11",capital_raised: "1000000",coin_status: "concept"},
		{name: "Komodo",symbol: "KMD",sale_date: "2016-10-15",ico_actual_end_date: "2016-11-20",capital_raised: "1983000",coin_status: "concept"},
		{name: "Bitgirls",symbol: "TOREKABU",sale_date: "2016-10-03",ico_actual_end_date: "2016-10-31",coin_status: "concept"},
		{name: "DarkSilk",symbol: "DSLK",sale_date: "2017-09-23",ico_actual_end_date: "2016-10-23",ico_planned_end_date: "2016-10-23",coin_status: "concept"},
		{name: "Decent",symbol: "DCT",sale_date: "2016-09-11",ico_actual_end_date: "2016-11-06",coin_status: "concept"},
		{name: "Antshares",symbol: "ANS",sale_date: "2016-08-08",ico_actual_end_date: "2016-09-07",ico_planned_end_date: "2016-09-07",capital_raised: "4500000",coin_status: "concept"},
		{name: "Kibo",symbol: "KBT",ico_actual_end_date: "2016-11-09",coin_status: "concept"},
		{name: "Synereo",symbol: "AMP",ico_actual_end_date: "2016-10-18",coin_status: "concept"},
		{name: "DeClouds",symbol: "DCS",ico_actual_end_date: "2016-10-07",coin_status: "concept"},
		{name: "BlockPay",symbol: "BLOCKPAY",ico_actual_end_date: "2016-09-15",coin_status: "concept"},
		{name: "Metaverse",symbol: "ETP",ico_actual_end_date: "2016-09-05",coin_status: "concept"},
		{name: "Incent",symbol: "INCNT",ico_actual_end_date: "2016-09-01",coin_status: "concept"},
		{name: "Tao Network",symbol: "XTO",ico_actual_end_date: "2016-08-16",coin_status: "concept"},
		{name: "Plimst",symbol: "PLM",sale_date: "2017-10-31",ico_actual_end_date: "2017-11-30",coin_status: "concept"},
		{name: "CryptoChip",symbol: "CRC",sale_date: "2017-09-29",ico_actual_end_date: "2017-10-29",coin_status: "concept"},
		{name: "0x",symbol: "ZRX",sale_date: "2017-09-09",ico_actual_end_date: "2017-10-09",coin_status: "concept"},
		{name: "Indorse",symbol: "IDS",sale_date: "2017-08-08",ico_actual_end_date: "2017-09-09",coin_status: "concept"},
		{name: "OneGram",symbol: "OGC",sale_date: "2017-08-05",ico_actual_end_date: "2017-08-08",coin_status: "concept"},
		{name: "Hive Project",symbol: "HVN",sale_date: "2017-07-30",ico_actual_end_date: "2017-08-30",coin_status: "concept"},
		{name: "district0x Network",symbol: "DNT",sale_date: "2017-07-18",ico_actual_end_date: "2017-08-01",coin_status: "concept"},
		{name: "onG.social",symbol: "ONG",sale_date: "2017-07-17",ico_actual_end_date: "2017-08-17",coin_status: "concept"},
		{name: "MyBit",symbol: "MYB",sale_date: "2017-07-17",ico_actual_end_date: "2017-08-16",coin_status: "concept"},
		{name: "Populous",symbol: "PPT",sale_date: "2017-07-16",ico_actual_end_date: "2017-08-16",coin_status: "concept"},
		{name: "Agrello",symbol: "DLT",sale_date: "2017-07-10",ico_actual_end_date: "2017-08-09",coin_status: "concept"},
		{name: "Starbase",symbol: "STAR",sale_date: "2017-07-01",ico_actual_end_date: "2017-08-15",coin_status: "concept"},
		{name: "Tezos",symbol: "XTZ",sale_date: "2017-07-01",ico_actual_end_date: "2017-08-01",coin_status: "concept"},
		{name: "XinFin Foundation",symbol: "XDC",sale_date: "2017-07-01",ico_actual_end_date: "2017-07-30",coin_status: "concept"},
		{name: "Stremio Adex",symbol: "ADX",sale_date: "2017-06-30",ico_actual_end_date: "2017-07-30",coin_status: "concept"},
		{name: "SunContract",symbol: "SNC",sale_date: "2017-06-30",ico_actual_end_date: "2017-07-28",coin_status: "concept"},
		{name: "Dao.Casino",symbol: "BET",sale_date: "2017-06-29",ico_actual_end_date: "2017-07-26",coin_status: "concept"},
		{name: "OmiseGO",symbol: "OMG",sale_date: "2017-06-27",ico_actual_end_date: "2017-07-27",coin_status: "concept"},
		{name: "Nimiq",symbol: "NET",sale_date: "2017-06-26",ico_actual_end_date: "2017-07-26",coin_status: "concept"},
		{name: "TenX",symbol: "PAY",sale_date: "2017-06-24",ico_actual_end_date: "2017-07-24",coin_status: "concept"},
		{name: "SkinCoin",symbol: "SKIN",sale_date: "2017-06-21",ico_actual_end_date: "2017-07-21",coin_status: "concept"},
		{name: "SilverCoin",symbol: "SVC",sale_date: "2017-06-21",ico_actual_end_date: "2017-07-19",coin_status: "concept"},
		{name: "Gilgam",symbol: "GGS",sale_date: "2017-06-20",ico_actual_end_date: "2017-07-20",coin_status: "concept"},
		{name: "Xarcade",symbol: "XAR",sale_date: "2017-06-20",ico_actual_end_date: "2017-06-30",coin_status: "concept"},
		{name: "Corion Platform",symbol: "COR",sale_date: "2017-06-18",ico_actual_end_date: "2017-07-30",coin_status: "concept"},
		{name: "SONM",symbol: "SNM",sale_date: "2017-06-15",ico_actual_end_date: "2017-07-15",coin_status: "concept"},
		{name: "CompCoin",symbol: "CMP",sale_date: "2017-06-14",ico_actual_end_date: "2017-07-31",coin_status: "concept"},
		{name: "Orocrypt",symbol: "OROC",sale_date: "2017-06-14",ico_actual_end_date: "2017-07-14",coin_status: "concept"},
		{name: "Honestis Network",symbol: "HNT",sale_date: "2017-06-14",ico_actual_end_date: "2017-07-05",coin_status: "concept"},
		{name: "SuperDAO",symbol: "SUP",sale_date: "2017-06-13",ico_actual_end_date: "2017-07-12",coin_status: "concept"},
		{name: "FundYourselfNow",symbol: "FYN",sale_date: "2017-06-13",ico_actual_end_date: "2017-07-02",coin_status: "concept"},
		{name: "Gene-ChainCoin",symbol: "GeneCC",sale_date: "2017-06-01",ico_actual_end_date: "2017-08-01",coin_status: "concept"},
		{name: "Prospectors",symbol: "OBT",sale_date: "2017-06-01",ico_actual_end_date: "2017-07-01",coin_status: "concept"},
		{name: "Air",symbol: "XID",sale_date: "2017-06-01",ico_actual_end_date: "2017-06-29",coin_status: "concept"},
		{name: "DCORP",symbol: "DRP",sale_date: "2017-06-01",ico_actual_end_date: "2017-06-29",coin_status: "concept"},
		{name: "Wagerr",symbol: "WGR",sale_date: "2017-06-01",ico_actual_end_date: "2017-06-25",coin_status: "concept"},
		{name: "Polybius",symbol: "PLBT",sale_date: "2017-05-31",ico_actual_end_date: "2017-07-05",coin_status: "concept"},
		{name: "Moeda",symbol: "MOEDA",sale_date: "2017-05-28",ico_actual_end_date: "2017-07-28",coin_status: "concept"},
		{name: "Octanox",symbol: "OTX",sale_date: "2017-05-25",ico_actual_end_date: "2017-06-26",coin_status: "concept"},
		{name: "FootballCoin",symbol: "XFC",sale_date: "2017-05-24",ico_actual_end_date: "2017-06-23",coin_status: "concept"},
		{name: "MaskNetwork",symbol: "MSK",sale_date: "2017-05-24",ico_actual_end_date: "2017-06-24",coin_status: "concept"},
		{name: "Crypviser",symbol: "CVC",sale_date: "2017-05-20",ico_actual_end_date: "2017-06-30",coin_status: "concept"},
		{name: "LeviarCoin",symbol: "XLC",sale_date: "2017-04-07",ico_actual_end_date: "2017-07-09",coin_status: "concept"},
		{name: "Internet of Coins",symbol: "HYBRID",sale_date: "2017-03-21",ico_actual_end_date: "2017-06-21",coin_status: "concept"}
	]

	user_id = 39

	networks.each do |network|  
		puts "#{network[:name]} — #{Network.friendly.exists? network[:name].downcase.gsub(".",-").gsub(" ",-")}"
		network_exists = Network.friendly.exists? network[:name].downcase.gsub(".","-").gsub(" ","-")
		if network_exists
			n = Network.friendly.find(network[:name].downcase.gsub(".","-").gsub(" ","-"))
			add_network_fields(n, network)
			puts "updating #{network[:name]}"
			if n.save
				nv = n.versions.last
				nv.whodunnit = user_id
				nv.save
			else
				puts 'problem saving #{network[:name]}'
			end
		else 
			n = Network.new
			n.name = network[:name]
			n.status = "concept"
			add_network_fields(n, network)	
			puts "adding #{network[:name]}"
			if n.save
				nv = n.versions.last
				nv.whodunnit = user_id
				nv.save
			else
				puts 'problem saving #{network[:name]}'
			end
		end
	end

	coins.each do |coin| 
		puts "#{coin[:name]} — #{Coin.friendly.exists? coin[:name].downcase.gsub(".","-").gsub(" ","-")}"
		coin_exists = Coin.friendly.exists? coin[:name].downcase.gsub(".","-").gsub(" ","-")
		if coin_exists
			c = Coin.friendly.find(coin[:name].downcase.gsub(".","-").gsub(" ","-"))
			add_coin_fields(c, coin)
			puts "updating #{coin[:name]}"
			if c.save
				cv = c.versions.last
				puts "cv is #{cv.inspect}"
				cv.whodunnit = user_id
				cv.save
			else 
				puts 'problem saving #{coin[:name]}'
			end
		else 
			c = Coin.new
			c.name = coin[:name]
			puts c.name
			unless coin[:ico_planned_end_date].nil?
				puts is_date(coin[:ico_planned_end_date])
			end
			if !coin[:ico_planned_end_date].nil? && !is_date(coin[:ico_planned_end_date]).nil? && coin[:ico_planned_end_date].to_date < Date.today
				c.coin_status = "live"
			else
				c.coin_status = "preproduction"
			end
			add_coin_fields(c, coin)
			n = Network.friendly.find(coin[:name].downcase.gsub(".","-").gsub(" ","-"))
			c.network = n
			puts "adding #{coin[:name]}"
			if c.save
				cv = c.versions.last
				puts "cv is #{cv.inspect}"
				cv.whodunnit = user_id
				cv.save
			else
				puts 'problem saving #{coin[:name]}'
			end
		end
	end
end

def is_date(string)
	return DateTime.parse "Ends when token supply runs out" rescue nil
end

def add_network_fields(n, network)
	unless network[:location].nil? 
		n.team_location = network[:location]
	end
	if n.description.nil? and !network[:description].nil?
		n.description = network[:description]
	end
	if n.category.nil?
		n.category_id = network[:category]
	end
	unless network[:blockchain].nil?
		n.blockchain = network[:blockchain]
	end	
	return n
end

def add_coin_fields(c, coin)
	if c.symbol.nil? and !coin[:capital_raised].nil? 
		c.symbol = coin[:symbol]
	end
	unless coin[:capital_raised].nil?
		c.capital_raised = coin[:capital_raised]
	end
	unless coin[:ico_use_of_proceeds].nil?
		c.ico_use_of_proceeds = coin[:ico_use_of_proceeds]
	end
	unless coin[:ico_token_sale_structure].nil?
		c.ico_token_sale_structure = coin[:ico_token_sale_structure]
	end
	unless coin[:capital_raised].nil?
		c.ico_pricing = coin[:ico_pricing]
	end
	unless coin[:ico_amount_sold].nil?
		c.ico_amount_sold = coin[:ico_amount_sold]
	end
	unless coin[:ico_allocation].nil?
		c.ico_allocation = coin[:ico_allocation]
	end
	unless coin[:ico_lockup].nil?
		c.ico_lockup = coin[:ico_lockup]
	end
	unless coin[:ico_buyer_lockup].nil?
		c.ico_buyer_lockup = coin[:ico_buyer_lockup]
	end
	unless coin[:ico_founder_lockup].nil?
		c.ico_founder_lockup = coin[:ico_founder_lockup]
	end
	unless coin[:ico_min_investment_cap].nil?
		c.ico_min_investment_cap = coin[:ico_min_investment_cap]
	end
	unless coin[:ico_type_of_min_cap].nil?
		c.ico_type_of_min_cap = coin[:ico_type_of_min_cap].downcase
	end
	unless coin[:ico_type_of_max_cap].nil?
		c.ico_type_of_max_cap = coin[:ico_type_of_max_cap].downcase
	end
	unless coin[:ico_max_investment_cap].nil?
		c.ico_max_investment_cap = coin[:ico_max_investment_cap]
	end
	unless coin[:ico_currency_accepted].nil?
		c.ico_currency_accepted = coin[:ico_currency_accepted]
	end
	unless coin[:ico_additional_notes].nil?
		c.ico_additional_notes = coin[:ico_additional_notes]
	end
	if c.saledate.nil? and !coin[:sale_date].nil?
		c.saledate = coin[:sale_date].to_date
	end
	if c.coin_info.nil? and !coin[:coin_info].nil?
		c.coin_info = coin[:coin_info]
	end
	if !coin[:ico_planned_end_date].nil? and !is_date(coin[:ico_planned_end_date]).nil?
		c.ico_planned_end_date = coin[:ico_planned_end_date].to_date
	end
	if !coin[:ico_actual_end_date].nil? and !is_date(coin[:ico_actual_end_date]).nil?
		c.ico_actual_end_date = coin[:ico_actual_end_date].to_date
	end
	return c
end
