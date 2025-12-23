## Problem Statement
Design a three-step Spark data processing pipeline using PySpark, containerised with Docker, and executed on a Kubernetes-based Spark cluster. The workflow orchestration will be handled by Apache Airflow.

Requirements
- 
Job 1: Preprocessing
-
Read employee data from Amazon S3
Perform basic preprocessing
Output the result as a Spark DataFrame
No intermediate files should be written to disk or S3

Job 2: Processing
-
Input: DataFrame output from Job 1
Apply business logic to classify employees into:
Senior
Junior

Add a new column called category
Output the result as a Spark DataFrame
No intermediate files should be persisted

Job 3: Post-processing
-
Input: DataFrame output from Job 2
Write the final processed data back to Amazon S3

Execution Constraints
-
Each job must be implemented in PySpark
Each job must be packaged as a Docker image
Jobs will run on Kubernetes using Spark-on-Kubernetes
Airflow will manage orchestration and dependencies:
Job 2 depends on Job 1
Job 3 depends on Job 2

Intermediate data must be passed in-memory (no temporary storage)

Technology Stack
-
Python (PySpark)
Apache Spark on Kubernetes/ minkube
Docker
Apache Airflow
Amazon S3/minIO

Objective
==
Explain how to implement this end-to-end pipeline, including:

PySpark job structure
Spark configuration for Kubernetes
Dockerfile setup for each job
Airflow DAG definition for orchestration and dependency management


# Minikube Setup
1. Install Minikube and start a local Kubernetes cluster:
2. minikube start --driver=docker
3. Enable the ingress addon:
4. minikube addons enable ingress
5. Set up MinIO in Minikube for S3-compatible storage:
6. kubectl apply -f https://raw.githubusercontent.com/minio/minio-operator/master/minio-operator.yaml
7. Create a MinIO instance and access credentials.
8. kubectl apply -f minio-instance.yaml
9. Access MinIO dashboard via port forwarding or ingress.
10. kubectl port-forward svc/minio 9000:9000
11. Use the MinIO web interface to create a bucket for employee data.
12. Upload sample employee data to the MinIO bucket.
13. mc alias set localminio http://localhost:9000 minioadmin minioadmin
14. mc mb localminio/employee-data
15. mc cp employee_data.csv localminio/employee-data/
16. # PySpark Job Structure
    

    minikube service airflow-webserver -n airflow --url
    minikube mount D:\pySaprk\airflow-data:/mnt/airflow-data
    kubectl create namespace airflow
    minikube mount D:\airflow:/mnt/airflow --uid=50000 --gid=50000

# List of DAGS
    kubectl exec -n airflow deploy/airflow-dag-processor -- ls /opt/airflow/dags
