//Agent created automatically

!start.

+!start <- .print("Hi").

+!makePayment[source(S)] <-
    .print("Item payed");
    .wait(1000);
    .send(seller,tell,paid);
    .

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
