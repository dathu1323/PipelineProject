# Use the official Jenkins LTS (Long-Term Support) image as the base

FROM jenkins/jenkins:lts

# Set the user to root to perform installation tasks

USER root

# Install additional tools if needed (Example: Install Git and Docker CLI)

RUN apt-get update && apt-get install -y git docker.io

# Optionally, install any Jenkins plugins you need (Example: Install the Git plugin)

#RUN /usr/local/bin/install-plugins.sh git

# Drop back to the regular Jenkins user

USER jenkins

# Optionally, set up any Jenkins configurations or copy custom files
# For example, copy the config.xml if you have custom configurations:
# COPY custom-config/config.xml /var/jenkins_home/config.xml

# If you need to expose additional ports, you can use the EXPOSE instruction
# For example, to expose port 8080 for the Jenkins web interface:
# EXPOSE 8080

# Start Jenkins when the container is launched
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]
