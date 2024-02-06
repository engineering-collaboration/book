## Infrastructure automation

Management of configuration drift

Configuration drift can be due to manual changes, software updates or errors, or entropy. Regularly check the desired configuration against its actual configuration and self-correct inconsistencies.

Elimitaion of snowflake servers

Snowflake servers have gotten their current configuration by a combination of manual changes from command line interfaces, GUI's, scripts and manual patches. IaC elimintaes these by clearly and dterminstiacally defining changes. Recreate server from scratch from the IaC recipe.

Versioning of IaC configs

Tests, static analysis, pull requests
All versions can be restored to any time we would need it from the past

