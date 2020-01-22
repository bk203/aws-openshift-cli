# aws-openshift-cli

Docker image combining the following tools:

* AWS ClI
* Kubernetes CLI (kubectl)
* OpenShift CLI (oc)

## Usage within OpenShift

On OpenShift we deploy a [CronJob](https://docs.openshift.com/container-platform/3.11/dev_guide/cron_jobs.html) that will be responsible for renewing the credentials stored within a secret.

```
# Grant privalliages to allow creation of secrets, admin is overpowered still researching
oc policy add-role-to-user admin system:serviceaccount:{$PROJECT}:default

# From GitHub
oc create -f https://raw.githubusercontent.com/bk203/aws-openshift-cli/master/cron.yaml

# From file
oc create -f cron.yaml
```

Next update the created ConfigMap containing your AWS credentials, and your done.

The CronJob will run every [“At every minute past every 8th hour.”](https://crontab.guru/#*_*/8_*_*_*), to manually start the job you can run:

```
oc create job refresh-aws-credentials --from=cronjob/aws-registry-credential-cron
```
