1. Navigate to containermonitoring folder

2. Build a new container image called containera

       docker build -t containera .

3. Set target IP address

   Update scrape_configs in prometheus/prometheus.yml with your host IP address. Note that when deploying to AWS, this modification is not required as there is a separate config file prometheus_aws.yml which uses dynamic service discovery to set the target IP address.

4. Launch Docker containers
       docker-compose up -d 
       docker run -t -d --name ContainerA containera

5. Configure Grafana dashboard

   5.1 In a browser navigate to http://localhost:3000/	       
       (for AWS: http://{PUBLIC IP}:3000/, if you are using my account you will notice the       public IP while executing the ansible playbooks)

   5.2 Login using the following credentials

       User: admin
       Password: admin

   5.3 Add data source

       Click on Add Data Source. Provide the following details:

           Name: prometheus
           Type: Prometheus
           URL: http://localhost:9090  (For AWS: http://{PUBLIC IP}:9090)
           Access: Direct

       Click on Add
       It should say “Success Data source is working”

    5.4 Import dashboard 

        Navigate to Dahsboard->Import located under the Grafana logo
        Click on Upload .josn file
        Locate container_monitoring_v1.josn file
        Select Prometheus under Options
        Click Import

The dashboard displays CPU, memory, filesystem, network rx, and network tx usage graphs. Once the memory usage reaches 500 MB and stays above 500MB for one minute you will receive an email alert sent to take-home-test@league.pagerduty.com 

