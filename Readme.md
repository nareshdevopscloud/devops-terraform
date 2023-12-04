#provisioners

 

1. File Provisioner 
2. Local-exec provisioner.
3. Remote-exec provisioner.

    #Understand about local-exec Provisioner.
    The local-exec provisioner invokes a local executable after a resource    is created.
    This invokes a process on the machine running Terraform, not on the    resource.
   


 ##local execution process

    provisioner  "local-exec" {
    
    command  =  "touch file500"
    
    }

    

#Understand about remote-exec Provisioner
The remote-exec provisioner invokes a script on a remote resource after it is created.
This can be used to run a configuration management tool, bootstrap into a cluster, etc.
    
    
    provisioner "remote-exec" {
        inline = [
    "touch file200", #create some while
    "echo hello from aws >> file200", #add content 
    ]
     }
    }




#understand about file provisioner 
The file provisioner copies files or directories from the machine running Terraform to the newly created resource 
The file provisioner supports ssh to connect remote.


    provisioner "file" {
        source      = "file10000"  # Replace with the path to your local file
        destination = "/home/ubuntu/file10000"  # Replace with the path on the remote instance
      }


