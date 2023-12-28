# Planning implementations

After product features have been milled into sprint tasks and the tasks assigned to respective teams and engineers, we start planning our implementation.

## Design Documents

For a majority of changes before diving straight into producing code we write a short design document with behavior expectations. These documents are short references to avoid misunderstandings between all stakeholders in the implementation process and typically contain expected input and output parameters, REST, GRPC or GraphQL schemas or domain specific agreements such as storage decisions based on data access frequency. Design documents are an imperative for larger scoped changes or inter team changes. 

We avoid turning this process into unnecessary red tape by involving the minimum amount of people necessary and strictly discussing the minimum of requirements for the task. The people involved can be limited to the engineer implementing the task, an engineer from the customer team, and optionally a tech lead. These conversations typically happen organically verbally or in team chats. We make it a habit of copying the information to a publicly available platform, preferably in form of [Documenting Decisions]().

## Existing solutions

Problems are always more difficult than initially assumed and we try to avoid re-writing code ourselves if a solution is available. Depending on our organization's open source policy we have a plethora of libraries and solutions available with permissive licensing.

We make use of our [innersource](../anatomy-of-a-software-company/innersourcing.md) channels and internal tech community to search for code, documentation, or engineers who have encountered a similar problem and verify if their workings are applicable for our use case. Minor modifications to existing code repositories are preferable over constructing personal solutions. All code we introduce into our organization increases potential maintenance work and bugs.

Having covered our basis of existing implementations, we get to work. As the implementing engineer we have full trust on implementation decisions as long as the output matches the agreed upon design doc. If the documented requirements turn out to be costly during development, we revisit the design doc with the stakeholders.
