//This file was generated from (Commercial) UPPAAL 4.0.15 rev. CB6BB307F6F681CB, November 2019

/*
Adversary will not be able to own any lands even introducing malicious transactions. The query should result in false because for \u201cAll the paths eventually adversary owns landId 0\u201d is completely false
because we made sure that blockchain won\u2019t allow adversary transactions and it cancels its transactions.
*/
A<> (parties[ADVERSARY].own_land[0] == true)

/*
\u201cThere exists a path eventually if ALICE won\u2019t own landId 0 imply that BOB owns it and BOB has balance of 35 and ALICE has 65\u201d which is completely true because
if alice buys its land bob must buy it for 15 amount and adversary is eliminated by blockchain.
*/
E<> (parties[ALICE].own_land[0] == false) imply (parties[BOB].own_land[0] == true) and (parties[BOB].balance == 35) and (parties[ALICE].balance == 65)

/*
\u201cAll paths eventually if ALICE won\u2019t own landId 0 imply that BOB owns it and BOB has balance of 35 and ALICE has 65\u201d which is completely false because not for all paths it is true
as the maximum number of transactions are limited and alice can keep on adding its transactions into blockchain which finally occupies maximum limit and it will go into deadlock.
*/
A<> (parties[ALICE].own_land[0] == false) imply (parties[BOB].own_land[0] == true) and (parties[BOB].balance == 35) and (parties[ALICE].balance == 65)

/*
Similar to 2nd query which is also true.
*/
E<> (parties[ALICE].own_land[0] == false) imply (parties[ALICE].balance == 65) and (parties[BOB].balance == 35)

/*
\u201cThere exists a path eventually BOB owns landId 0\u201d which is completely true because there exists a path and eventually BOB owns landId 0 because ALICE is ready to buy its land.
*/
E<> (parties[BOB].own_land[0] == true)

/*
\u201cThere exists a path eventually if ALICE doesn\u2019t own landId 4 imply ALICE has a balance of 95 and BOB has 5\u201d which is completely true because as ALICE owns all even lands at first then
it sells it land one by one that it owns which are 0,2,4 landIds. Eventually after selling its land 4 its balance must be 50 + 3(15) = 95.
And that means BOB balance must be 50 \u2013 3(15) = 5 which means further BOB won\u2019t be able to buy any land even though ALICE broadcasts to sell its all even lands into smart contract.
*/
E<> (parties[ALICE].own_land[4] == false) imply (parties[ALICE].balance == 95 and parties[BOB].balance == 5)

/*
\u201cAll paths eventually if ALICE balance is 95 imply that ALICE doesn\u2019t own landId 4\u201d which is completely true because for all paths if ALICE balance is 95 means
ALICE doesn\u2019t own landId 4 and ADVERSARY also doesn\u2019t own any land because BOB buys the lands from ALICE.
*/
A<> (parties[ALICE].balance == 95) imply (parties[ALICE].own_land[4] == false)

/*
Similar to 7th query
*/
A<> (parties[ALICE].balance == 65) imply (parties[ALICE].own_land[0] == false)

/*
\u201cAll paths eventually ALICE balance is 95\u201d which is completely false because as there is a limit to number of transactions in blockchain the ALICE can keep on adding its transactions
into blockchain without giving LandInspector chance to perform its operations through loop as a result the system will reach deadlock after it reaches maximum limit of transactions.
*/
A<> (parties[ALICE].balance == 95)

/*
\u201cAll paths eventually ADVERSARY owns landId 0 or 2 or 4\u201d which is completely false because adversary is not allowed to own land at first and
later as well it may confuse the blockchain on introducing malicious transactions but blockchain will cancel all its transactions and in all paths at least it won\u2019t even own a single land.
*/
A<> (parties[ADVERSARY].own_land[0] == true or parties[ADVERSARY].own_land[2] == true or parties[ADVERSARY].own_land[4] == true)
