//Agent created automatically

!start.

+!start <- .print("Hi").

+!needingItem <-
    .print("Asking to buy item...");
    .wait(1000);
    .send(buyer,achieve,buyItem);
    .

+!storeItem : true <-
    .wait(1000);
    .print("Incrementing input stock...");
    inc;
    .

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
