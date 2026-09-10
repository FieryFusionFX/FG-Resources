return {
    maxDealDistance = 3.0, -- meters apart buyer/seller can be to start or complete a deal
    payoutCurrency = 'black_money', -- drug proceeds are dirty money, same as corner-selling - launder it via fg_laundering
    offerTimeout = 30000, -- ms the buyer has to accept/decline before the offer expires
    sellableItems = {
        'weed_white-widow', 'weed_skunk', 'weed_purple-haze', 'weed_og-kush', 'weed_amnesia', 'weed_ak47',
        'meth', 'cokebaggy', 'crack_baggy',
    },
}
