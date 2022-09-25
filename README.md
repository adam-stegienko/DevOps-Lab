# Adam Lab

TO DO TODAY (21.09.2022):
Write down sub-tasks for today's thumbnailer --> upload image.io artifact to JFrog and tell thumbnailer to retrieve this dependency from the artifactory to use it

1. Create a 'dev' server on ec2 large (all further will also be done on large EC2) -- PASSED
2. Run maven docker image and exec bash -- PASSED
3. Create a volume as follows: "~/.m2/repository:~/.m2/repository" -- PASSED
4. Copy the thumbnailer project and io-extenstions project sources into "repository" directory and build first io-ext ("mvn install" to build dev version and save artifact on local repo), then thumbnailer ("maven verify" to simply build an app) -- PASSED
5. Run "thumbnailer.sh" from target directory and check if you can create thumbnails with it (CHECKPOINT! --> if not working, debug) -- PASSED

---------------------------------------------------

6. Create a docker-compose.yaml file with full build network, including GitLab, Jenkins, and JFrog artifactory containers -- PASSED
7. Set up GitLab server --> register user, add ssh (or save credentials), create two repositories, push io-ext sources to io-ext repo, push thumbnailer app sources to thumbnailer repo -- PASSED
8. Set up Jenkins server --> Install Jenkins, add maven integration and config file provider plugins (to upload settings.xml to integrate with JFrog artifactory), make sure to configure JDK Java_Home fo Open JDK 8 (locate it first on maven container), add maven 3.6.2 tool, set up connection to GitLab
9. Set up JFrog artifactory server --> install artifactory with a maven (dev) repository -- PASSED
10. Create a jenkins job --> pull image-io-extensions from gitlab and use "mvn install" on it (CHECKPOINT! --> if not working, debug) -- PASSED

----------------------------------------------------

11. Generate "settings.xml" file allowing to upload to "libs-release-local" and "libs-snapshot-local" repositories (all done using JFrog UI) -- PASSED
12. Store "settings.xml" as settings file for the user called "maven" (using config file provider plugin in system settings) -- PASSED
13. Update your existing job from "mvn install" command to "mvn deploy" and make it accept the new maven settings file -- PASSED
14. Deploy artifact into "libs-snapshot" repository in JFrog (CHECKPOINT! --> if not working, debug) -- PASSED

-------------------------------------------------------

15. Implement a new CI job (image-io-extensions CI) that is triggered by push to master branch --> performing "mvn deploy" -- CI Pipeline-Jenkinsfile!! -- TODO
16. Implement a new CI job (thumbnailer CI) that is triggered by push to master branch --> performing "mvn install" -- CI Pipeline-Jenkinsfile!! -- TODO
17. Push any changed to master and see if this triggers a successful build and a successful deploy (CHECKPOINT! --> if not working, debug)

-------------------------------------------------------

18. Again on EC2 large ('dev server'), create a Dockerfile and entry-point.sh files for thumbnailer app --> docker build from Dockerfile, docker run with volume pointing to container's "/pics" dir
19. In Dockerfile include --> FROM maven:3.6.2 ENTRYPOINT pointing to "entry-point.sh", ENVIRONMENT variable default as [TN_SIZE=150], RUN mvn package
20. In "entry-point.sh" include --> creating thumbnails on all files found in "/pics" dir, environment variable TN_SIZE overwriting default value (on demand)
21. Add a new "dockerfile maven" plugin to thumbnailer's "pom.xml" file
22. Run the new docker image with examples folder as input, bearing in mind that JPEG extension files should be thumbnailed while TIFF extension files should not (CHECKPOINT! --> if not working, debug)

-------------------------------------------------------

23. Create a new manually triggered job in Jenkins for release of image-io-extensions --> user version 3.5 and specify it for maven, using specifically a command "mvn version:set -DnewVersion=3.5"
24. Release version 3.5 of image-io-extensions appear in JFrog artifactory, name in repo called "libs-release-local" (CHECKPOINT! --> if not working, debug)

--------------------------------------------------------

25. Add a new dependecy to thumbnailer --> image-io-extensions:3.5
26. Make CI automatically create a new docker image supporting TIFF extension and test it on "examples" folder --> (CHECKPOINT! --> if not working, debug)

--------------------------------------------------------

27. Draw a beatiful topology diagram for the whole project.
28. Provide the diagram, image-io-extensions CI pipeline's Jenkinsfile, and thumbnailer CI pipeline's Jenkinsfile to Google Classroom