/*
In the 'buyer' agent, Moise coordination mechanism will set on 'marketplace.xml' will trigger 
the goal 'buyitem' once, the goal 'supplyItem' in the 'seller', then the goal 'makePayment' again in the
buyer to finally trigger 'deliverItem' in the seller.

Besides the coordination mechanism, here we have redundant messages from agent to agent to illustrate
jacamo-web message exchanging interface.

@author Cleber Jorge Amaral
*/

+!start <-
	.at("now +2 s", { +!createAgent(buyer,"buyer.asl") });
	.at("now +4 s", { +!createAgent(seller,"seller.asl") });
	.at("now +6 s", { +!createAgent(stocker,"stocker.asl") });
	.at("now +6 s", { +!createAgent(payer,"payer.asl") });
	.at("now +8 s", { +!createAgent(collector,"collector.asl") });
	.at("now +8 s", { +!createAgent(packer,"packer.asl") });
	.at("now +10 s", { +!ask_focus_artifact });
	.at("now +11 s", { +!ask_adopt_roles });
	.at("now +30 s", { +!ask_accept_scheme });
.

+!ask_adopt_roles <-
	.send(buyer,achieve,adopt_role(rbuyer,purchases,factory));
	.send(buyer,achieve,adopt_role(rrbuyer,businessPartners,marketplace));
	.send(seller,achieve,adopt_role(rseller,sales,supplier));
	.send(seller,achieve,adopt_role(rrseller,businessPartners,marketplace));
	.send(stocker,achieve,adopt_role(rstocker,purchases,factory));
	.send(payer,achieve,adopt_role(rpayer,purchases,factory));
	.send(collector,achieve,adopt_role(rcollector,sales,supplier));
	.send(packer,achieve,adopt_role(rpacker,sales,supplier));
.

+!createAgent(A, File) <-
    .create_agent(A, File, [beliefBaseClass("jason.bb.TextPersistentBB")]).

+!ask_accept_scheme <-
    .send(seller,achieve,acceptScheme(itemTransaction,msupply));
    .send(buyer,achieve,acceptScheme(itemTransaction,mbuy));
.

+!ask_focus_artifact <-
    .send(buyer,achieve,focusIn(buyerStorehouse,inputStock));
    .send(stocker,achieve,focusIn(buyerStorehouse,inputStock));
    .send(seller,achieve,focusIn(sellerStorehouse,outputStock));
    .send(packer,achieve,focusIn(sellerStorehouse,outputStock));
    .

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
