# DevOps GitLab


1. Topology drawing
 aws + gitlab + jenkins + cowsay container, basically all servers in one drawing (topology drawing) -- PARTY DONE (I will come back to it later)

2. AWS step !!! -- PASSED, instance run and I got access to it

3. Jenkins with docker installed (get the info how to do it) --> use dockerfile to create an image for jenkins (add docker and add jenkins to docker group) -- PASSED

4. Docker-Compose for both dockerable Jenkins-Master and GitLab (community edition) --> expose http 80 port for GitLab, expose 22 for GitLab SSH port, expose http 8080 port for Jenkins -- PASSED

5. Create a cowsay repo in GitLab. Push the cowsay sources into there.

6. Write a build pipeline to build cowsay. (step 1 is to build; step 2 is to test: docker run cowsay and use curl to see if the site is available)

NOTE: apply docker socket solution for docker in docker --> connect docker socket inside a container to the host docker socket


