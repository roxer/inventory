# Part 1: Backend Architecture

The onboarding solution is flexible to add/remove or modify any step with custom rules.  
`onboardings` table holds `current_step` and  step values. 
'onboarding_states' holds info only for executed steps. 
`requested_integrations` uses Array data type. Existing integrations are connected to user by join table. 

Steps definitions are in model `Onboarding::STEPS` but in can be moved to configuration file to load it on Rails startup

For `locked` steps there could be Directed Acyclic Graph describing all steps for topological sorting (flexible solution to check any dependencies only with configuration - on codebase changes for new requirements)

Swagger OpenAPI v3.1 https://fabrikator.knog.pl/api-docs/index.html

Demo http://roxer.iq.pl/demo/inventory_api_demo.mov

API implements:
* create new user - to get `user_id` for next api calls 
* second step - create Onboarding with `POST` request
* `PATCH` request updates only one step at the time - step state and its value
* `GET` request for `onboarding` shows current values for all steps
* `GET` request for `onboarding/steps` shows current step and all steps states 

Rails implementation is simple and based only on models and controllers. 
There is no authentication, validation nor design patterns as service, query objects. 

**Background processing** can be implemented with native Rails solid queue, Sidekiq or any cloud service (eg. AWS lambda). The choice depends on scalability requirements and hosting/cloud provider. 

**Side effects** for each step can be implemented with callbacks. Definitions can be stored in `Onboarding::STEPS` or in application config.

For frequent updates (eg. progress checks) the are a few solutions:
* HTTP polling (ActionCable Live)
* Web sockets (Solid Cable)
* External DB with native push functionality - Google Firebase, Supabase, AWS Amplify, Appwrite


