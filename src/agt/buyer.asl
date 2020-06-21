!start.

+!start <- .print("Hi").

+!buyItem <-
    .print("Ordering item...");
    .wait(1000);
    .send(seller,achieve,supplyItem);
    .

+!makePayment[source(S)] <-
    .print("Asking to pay ", S);
    .wait(1000);
    .abolish(itemDelivered);
    .send(payer,achieve,makePayment);
    .

+itemDelivered[source(S)] <-
    .wait(2000);
    .print(S," delivered the item.");
    .send(stocker,achieve,storeItem);
    .

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$moiseJar/asl/org-obedient.asl") }
