# Game plan

## Process within a code change

product roadmap
design docs
PR reference

After product features have been milled into sprint tasks and the tasks assigned to respective teams and engineers we start planning our implementation. For larger scoped changes or inter team changes we advise writing a design document with behavior expectations. These documents are short references to avoid misunderstandings between all stakeholders in the implementation process and typically contain expected input and output parameters, REST, GRPC or GraphQL schemas or domain specific agreements such as storage decisions based on data access frequency.

We avoid turning this process into unnecessary red tape by only involving the minimum amount of people and discussing the minimum of shared requirements, typically the engineer implementing the task, an engineer from the customer team, and optionally a tech lead. These conversations happen organically verbally or in team chats. We make it a habit of copying the information to a publicly available platform.

### Implementation strategies

Opensource
Innersource
Build it

Ask innersource channel, stackoverflow, team, tech leads, tech community. Always prefere existing solutions. Problems are always more difficult than initially assumed.

The implementing engineer utlimately pulls the trigger on the decision and is trusted to ultimately make the decision.

Document the decision on whatever platform, or PR, reference the design doc.


The implementing engineer has full trust on implementation decisions as long as the output matches the agreed upon design doc. Should implementation decisions turn out to be costly the design doc may be revisited with the stakeholders.
