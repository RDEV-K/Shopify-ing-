Development Quality & Login Process

**Branch Description**
- The developer-working branch is where collaborates should develop the sofware.
- The live-test branch is connected to test.ingrevo.com. Developer branches will be pulled into the test branch for testing on the server before being deployed to the live software.
- The master is connected to ingrevo.com. This is where the stable version of the software is stored. 

**Deloyment Process**
- A developer should develop only in the branch created for them. For each push please reference the issue log number.
- Once the software has been developed, it will be pulled into the test branch for local testing and live testing. For live testing it should be uploaded via filezilla to the online server in the test environment.
- Once online testing has been completed, it should ready for deployment to the live server and pulled into the main-branch.
- Before a deployment to the live server, the changelog, release notes (social media, blog and email) should be developed to explain the changes made.
- Before the master is uploaded, the current live server should be backuped up in case a roll back in needed.
- When the master has been uploaded via filezilla to the online live environment, testing should be undertaken to check all is functioning, then the changelog should be released.

**FTP Details (Filezilla)**
- FTP IP: ftp://141.136.33.20
- FTP Port: 21
- FTP Host Name: ftp.ingrevo.com
- Username: u362910151.Test_Server
- Password: =^TAJjB_8!k+Pf9

**Database & Login**
- Database: Two databases are needed to run ingrevo. cosman and dbs9676241. You will find both of these databases within the app/databases folder.
- Cosman - Holds the database required for the software.
- dbs9676241 - Holds the database required for the subscription which is managed by Wordpress.

Local Login Details
- Email: hello@ingrevo.com
- Password: 000000

Test Login Details
- Email: hello@ingrevo.com
- Password: 123456
