//Agent created automatically

!start.

+!start <- .print("Hi").

+paid[source(S)] <-
    .wait(2000);
    .print(S, " payment conformed, ordering pack.");
    .send(packer,achieve,deliverItem);
    .abolish(paid);
    .

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
