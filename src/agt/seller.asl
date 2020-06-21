!start.

+!start <- .print("Hi").

+!supplyItem[source(S)] <-
    .print(S, " ordered item...");
    .wait(2000);
    .abolish(paid);
    .send(buyer,achieve,makePayment);
    .
    
+paid[source(S)] <-
    .wait(1000);
    .print(S, " has paid the invoice.");
    .send(collector,tell,paid);
    .abolish(paid);
    .

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$moiseJar/asl/org-obedient.asl") }
