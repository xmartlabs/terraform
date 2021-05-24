# Module S3
By default all buckets are private.


## This module creates a :

- Private Bucket

- Bucket policy:
    For a bucket, you can add a bucket policy to grant permissions to other AWS accounts or IAM users for the bucket and the objects it contains.
    Any object permissions apply only to the objects that the bucket owner creates.


Other wey to restrict the acces is create a User policies
User policies:
You can use IAM to manage access to your Amazon S3 resources. You can create IAM users, groups, and roles in your account and attach access policies to them that grant them access to AWS resources, including Amazon S3. You cannot grant anonymous permissions in an IAM user policy, because the policy is attached to a user.


## Ownership and request authentication in s3 :
By default, only the resource owner can access these resources.
The resource owner refers to the AWS account that creates the resource.
