/*
In the 'buyer' agent, Moise coordination mechanism will set on 'marketplace.xml' will trigger 
the goal 'buyitem' once, the goal 'supplyItem' in the 'seller', then the goal 'makePayment' again in the
buyer to finally trigger 'deliverItem' in the seller.

Besides the coordination mechanism, here we have redundant messages from agent to agent to illustrate
jacamo-web message exchanging interface.

@author Cleber Jorge Amaral
*/

+!adopt_role(R,G,O) <-
    joinWorkspace(O,Ofa);
    organisation::focusWhenAvailable(G);
    organisation::adoptRole(R);
.

+!acceptScheme(S,M) <-
    organisation::lookupArtifact(S, ScArtId);
    organisation::commitMission(M)[artifact_id(ScArtId)];
.

+!focusIn(W,A) <-
    environment::joinWorkspace(W,Ofa);
    environment::lookupArtifact(A,Aid)[wid(Ofa)];
    environment::focus(Aid);
.
