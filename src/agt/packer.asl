//Agent created automatically

!start.

+!start <- .print("Hi").
    
+!deliverItem : true <-
    .wait(1000);
    .print("Decrementing output stock and delivering item...");
    dec;
    .send(buyer,tell,itemDelivered);
    .abolish(paid);
    .

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
