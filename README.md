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
