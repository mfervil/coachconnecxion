*** Configuring project ***
1. Set SMTP server settings in pom.xml
2. Set correct "From" value for emails in "mail_templates.properties" if required
Next settings can be specified in pom.xml either under profile "dev", which is activated by default, or under new created profile.
In latter case new profile name should be used with all Maven commands (use -P[profile_name])
3. Specify production DB credentials: "_jdbc.url", "_jdbc.username", "_jdbc.password"
4. Specify test DB credentials: "_test.jdbc.username", "_test.jdbc.password", "_test.jdbc.url"
5. Specify server URL: "_url". Value will be used in activation email as prefix
6. Optionally specify log4j appenders: "_log4j.appenders"

*** Building project ***
1. Create production MySQL database with name "springsecuritydemo_db"
2. Initialize production DB either with running "mvn db-migration:reset" or manually with running scripts "create_db.sql" and "0001.sql"
3. Create empty test MySQL database "springsecuritydemo_test_db" for running unit tests
4. Run "mvn -U clean package" to build the project. Unit tests will be executed during this process.
5. Find WAR file in "target" folder

*** Running the project ***
1. Drop WAR file into Tomcat webapps directory
